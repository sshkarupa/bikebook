User.create(
    email: ENV['admin_email'],
    password: ENV['admin_password'],
    password_confirmation: ENV['admin_password'],
    role: 'user',
    name: 'Павел'
)
Phone.create(number: ENV['admin_phone'], activated: true, user_id: 1)

puts 'Add admin: [OK]'

db_path = File.expand_path("../russia.json", __FILE__)
russia_db = open(db_path).read
JSON::parse(russia_db).each do |item|
  department = Department.create!(:name => item["department"])
  item["cities"].each do |city|
    department.cities.create!(:name => city)
  end
end
puts 'Add cities: [OK]'

BikeType.create!(name: "Горный велосипед")
BikeType.create!(name: "Городской велосипед")
BikeType.create!(name: "Шоссейный велосипед")
BikeType.create!(name: "Гибридный велосипед")
BikeType.create!(name: "MTB")
BikeType.create!(name: "BMX")
BikeType.create!(name: "29er")
BikeType.create!(name: "Фэт-байк")
BikeType.create!(name: "Электровелосипед")
puts 'Add bike_types: [OK]'

Sex.create!(name: "Мужской")
Sex.create!(name: "Женский")
Sex.create!(name: "Юнисекс")
puts 'Add sex: [OK]'

Age.create!(name: "Взрослый")
Age.create!(name: "Юниор")
Age.create!(name: "Детский")
puts 'Add age: [OK]'

Suspension.create!(name: "С двумя амортизаторами")
Suspension.create!(name: "C одним амортизатором")
Suspension.create!(name: "Без амортизаторов")
puts 'Add suspension: [OK]'