User.create(email: 'p.scheglov@gmail.com', password: '543424345', password_confirmation: '543424345', phone: '+7 (915) 030-02-00')
User.create(email: 'mail@gmail.com', password: '543424345', password_confirmation: '543424345', phone: '+7 (915) 030-02-33')

5.times do |index|
  User.find_by(email: 'p.scheglov@gmail.com').bikes.create(
      title: "Новое объявление#{index}",
      description: 'orem orem oremoremorem',
      bike_type: 'mtb',
      gears: 24,
      wheels: 30,
      suspension: 'hardtail',
      sex: 'men',
      price: 100000
  )
end

5.times do |index|
  User.find_by(email: 'mail@gmail.com').bikes.create(
      title: "Новое объявление#{index}",
      description: 'orem orem oremoremorem',
      bike_type: 'mtb',
      gears: 24,
      wheels: 30,
      suspension: 'hardtail',
      sex: 'men',
      price: 100000
  )
end