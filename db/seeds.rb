require 'faker'

#User Accounts
2.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
end
users = User.all

#Admin Account
admin = User.new(
   name:     'Eric Park',
   email:    'erichoonpark@gmail.com',
   password: 'bullseye',
 )
admin.skip_confirmation!
admin.save!

 # Create Items
50.times do
   Item.create!(
     name:  Faker::Lorem.sentence,
     user:   users.sample,
   )
end
item = Item.all

puts "Seed finished"
puts "#{users.count} account created"
puts "#{Item.count} items created"
