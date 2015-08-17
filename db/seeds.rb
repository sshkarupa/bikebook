User.create(email: 'p.scheglov@gmail.com', password: '543424345', password_confirmation: '543424345', phone: '+7 (915) 030-02-00')

# Add cities to department from russia db
db_path = File.expand_path("../russia.json", __FILE__)
russia_db = open(db_path).read
JSON::parse(russia_db).each do |item|
  department = Department.create!(:name => item["department"])
  item["cities"].each do |city|
    department.cities.create!(:name => city)
  end
end