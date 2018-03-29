class House
  attr_reader :id
  attr_accessor :name, :url
  def initialize(options)
    @id = options['id'] unless options['id'] == nil
    @name = options['name']
    @url = options['url'] unless options['url'] == nil
  end

  def self.all()
    sql = "SELECT * FROM houses"
    result = SqlRunner.run( sql )
    return result.map { |house| House.new(house) }
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run( sql )
  end

  def save()
    sql = "INSERT INTO houses
    (name,url)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@name, @url]
    result = SqlRunner.run( sql, values )
    @id = result.first['id']
  end

  def delete()
    sql = "DELETE FROM houses
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

end
