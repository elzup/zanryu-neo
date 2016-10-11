# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(:email => '99xx999@ms.dendai.ac.jp', :password => 'toshino')
user.skip_confirmation!
user.save!
puts 'Create 1 User'

admin_user = User.new(
    :email => 'profeccer@ms.dendai.ac.jp',
    :password => 'toshino',
    :is_admin => true,
    :admin_code => '123abc',
)
admin_user.skip_confirmation!
admin_user.save!
puts 'Create 1 Admin User'

room = admin_user.rooms.new(:label => '教室', :code => 'aaa111')
room.save!
puts 'Create 1 Room'

request = Request.create(
    date: Time.new(2016, 10, 11, 0, 0, 0, 0)

)
user.requests << request
room.requests << request
