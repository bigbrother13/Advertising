require 'faker'

#table users
user = User.find_or_create_by!(email: "user@gmail.com") do |user|
          user.username = "VPG"
          user.password = '12345678'
          user.bio      = Faker::Superhero.name
        end

admin = User.find_or_create_by!(email: "admin@gmail.com") do |user|
          user.username = "NPS"
          user.password = '12345678'
          user.bio      = Faker::Superhero.name
          user.admin    = true
        end

# table pins
if Pin.count == 0
  pin_man = Pin.new(title: 'Man', description: 'for Man', user_id: user.id, status: 4)
  pin_man.image = File.open('public/assets/seeds/man.jpg')
  pin_man.save!

  pin_man_1 = Pin.new(title: 'Casio', description: 'for Man', user_id: user.id, status: 4)
  pin_man_1.image = File.open('public/assets/seeds/clock1.jpg')
  pin_man_1.save!

  pin_man_2 = Pin.new(title: 'Rolex', description: 'for Man', user_id: user.id)
  pin_man_2.image = File.open('public/assets/seeds/clock2.jpg')
  pin_man_2.save!

  pin_man_3 = Pin.new(title: 'JVP', description: 'for Man', user_id: user.id)
  pin_man_3.image = File.open('public/assets/seeds/clock3.jpg')
  pin_man_3.save!

  pin_man_4 = Pin.new(title: 'Adidas', description: 'for Man', user_id: user.id)
  pin_man_4.image = File.open('public/assets/seeds/clock4.jpg')
  pin_man_4.save!


  pin_woman = Pin.new(title: 'woman', description: 'for Woman', user_id: user.id, status: 4)
  pin_woman.image = File.open('public/assets/seeds/women.jpg')
  pin_woman.save!

  pin_woman_1 = Pin.new(title: 'woman', description: 'for Woman', user_id: user.id, status: 4)
  pin_woman_1.image = File.open('public/assets/seeds/women_clock_2.jpg')
  pin_woman_1.save!

  pin_woman_2 = Pin.new(title: 'woman', description: 'for Woman', user_id: user.id, status: 4)
  pin_woman_2.image = File.open('public/assets/seeds/women_clock_3.jpg')
  pin_woman_2.save!

  pin_woman_3 = Pin.new(title: 'woman', description: 'for Woman', user_id: user.id, status: 4)
  pin_woman_3.image = File.open('public/assets/seeds/women_clock_4.jpg')
  pin_woman_3.save!
end

# table category
if Category.count == 0
  women = Category.create(name: 'Women clock')
  Category.create(name: 'Electronic', ancestry: women.id)
  Category.create(name: 'Mechanical', ancestry: women.id)

  men = Category.create(name: 'Men clock')
  Category.create(name: 'Electronic', ancestry: men.id)
  Category.create(name: 'Mechanical', ancestry: men.id)
end
