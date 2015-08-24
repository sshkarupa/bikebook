User.create(email: ENV['admin_email'], password: ENV['admin_password'], password_confirmation: ENV['admin_password'], role: 'admin', name: 'Павел')

# Add cities to department from russia db
db_path = File.expand_path("../russia.json", __FILE__)
russia_db = open(db_path).read
JSON::parse(russia_db).each do |item|
  department = Department.create!(:name => item["department"])
  item["cities"].each do |city|
    department.cities.create!(:name => city)
  end
end

# Add bike_types
BikeType.create!(name: "Горный велосипед")
BikeType.create!(name: "Городской велосипед")
BikeType.create!(name: "Шоссейный велосипед")
BikeType.create!(name: "Гибридный велосипед")
BikeType.create!(name: "MTB")
BikeType.create!(name: "BMX")
BikeType.create!(name: "29er")
BikeType.create!(name: "Фэт-байк")
BikeType.create!(name: "Электровелосипед")

# Add sex
Sex.create!(name: "Мужской")
Sex.create!(name: "Женский")
Sex.create!(name: "Юнисекс")

# Add age
Age.create!(name: "Взрослый")
Age.create!(name: "Юниор")
Age.create!(name: "Детский")

# Add suspension
Suspension.create!(name: "С двумя амортизаторами")
Suspension.create!(name: "C одним амортизатором")
Suspension.create!(name: "Без амортизаторов")