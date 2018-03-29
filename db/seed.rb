require_relative('../models/house')
require_relative('../models/student')

Student.delete_all()
House.delete_all()

house01 = House.new({ 'name' => 'Fire' })
house02 = House.new({ 'name' => 'Water' })
house03 = House.new({ 'name' => 'Earth' })
house04 = House.new({ 'name' => 'Air' })

house01.save()
house02.save()
house03.save()
house04.save()

student01 = Student.new({ 'first_name' => 'Jaime' ,'second_name' => 'Lopez', 'age' => 29,'house_id' => house01.id })
student02 = Student.new({ 'first_name' => 'Alex','second_name' => 'Lakin', 'age' => 30,'house_id' => house02.id })
student03 = Student.new({ 'first_name' => 'Marta','second_name' => 'Beveridge', 'age' => 24,'house_id' => house03.id })
student04 = Student.new({ 'first_name' => 'Pawel','second_name' => 'O', 'age' => 32,'house_id' => house04.id })

student01.save()
student02.save()
student03.save()
student04.save()
