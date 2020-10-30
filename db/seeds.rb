require 'faker'

#table users
user = User.find_or_create_by!(email: "0@gmail.com") do |user|
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
  pin_man = Pin.new(title: 'Man', description: 'for Man', user_id: admin.id)
  pin_man.image = File.open('public/assets/seeds/man.jpg')
  pin_man.save!

  pin_woman = Pin.new(title: 'woman', description: 'for Woman', user_id: admin.id)
  pin_woman.image = File.open('public/assets/seeds/women.jpg')
  pin_woman.save!
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
