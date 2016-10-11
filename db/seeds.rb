user = User.new(
    :name => '歳納京子',
    :email => '99xx999@ms.dendai.ac.jp',
    :password => 'toshino'
)
user.skip_confirmation!
user.save!
puts 'Create 1 User'

admin_user = User.new(
    :name => '岩井',
    :email => 'professor@ms.dendai.ac.jp',
    :password => 'toshino',
    :is_admin => true,
    :admin_code => '123abc',
)
admin_user.skip_confirmation!
admin_user.save!
puts 'Create 1 Admin User'

room = Room.new(:label => '教室', :code => 'aaa111')
room.save!
puts 'Create 1 Room'

request = Request.create(
    date: Time.new(2016, 10, 11, 0, 0, 0, 0),
    admin_id: admin_user.id
)
user.requests << request
room.requests << request
