require_relative('../db/sql_runner')

class Student
  attr_reader :id
  attr_accessor :first_name, :second_name, :house, :age
  def initialize(options)
    @id = options['id'] unless options['id'] == nil
    @first_name = options['first_name']
    @second_name = options['second_name']
    @age = options['age']
    @house_id = options['house']
  end

  def self.all()
    sql = "SELECT * FROM students"
    result = SqlRunner.run( sql )
    return result.map { |student| Student.new(student) }
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run( sql )
  end

  def save()
    sql = "INSERT INTO students
    (first_name, second_name, house_id, age)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@first_name, @second_name, @house_id, @age]
    result = SqlRunner.run( sql, values )
    @id = result.first['id']
  end

  def delete()
    sql = "DELETE FROM students
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def find(id)
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [@id]
    result = SqlRunner.run( sql, values)
    return result[0].map { |student| Student.new(student) } unless result[0] == nil
  end

end
