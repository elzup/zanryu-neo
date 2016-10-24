user = User.new(
    :name => '歳納京子',
    :email => '99xx999@ms.dendai.ac.jp',
    :password => 'toshino',
    :label => 'kyoko'
)
user.skip_confirmation!
user.save!
puts 'Create 1 User'


admin = User.new(
    :name => '岩井',
    :email => 'professor@ms.dendai.ac.jp',
    :password => 'toshino',
    :is_admin => true,
    :admin_code => '123abc',
    :label => 'iwi'
)
admin.skip_confirmation!
admin.save!
admin2 = User.new(
    :name => 'テスト教授',
    :email => 'professor2@ms.dendai.ac.jp',
    :password => 'toshino',
    :is_admin => true,
    :admin_code => '123abc2',
    :label => 'test'
)
admin2.skip_confirmation!
admin2.save!
puts 'Create 1 Admin User'



room = Room.new(:label => '教室', :code => 'aaa111')
room.save!
puts 'Create 1 Room'



s = Date.today - 10.day
e = Date.today + 30.day
(s..e).step(1) do |d|
  Request.create(
      date: d,
      user_id: user.id,
      room_id: room.id,
      admin_id: admin.id
  )
end

10.times do |i|
  u = User.new(
      :name => "user#{i}",
      :email => "00aa#{i}@ms.dendai.ac.jp",
      :password => 'toshino',
      :label => "user#{i}"
  )
  u.skip_confirmation!
  u.save!
  Request.create(
      date: Date.today,
      user_id: u.id,
      room_id: room.id,
      admin_id: admin.id
  )
end
puts "Create #{Request.count} User"
puts "Create #{Request.count} Request"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts "Create #{AdminUser.count} AdminUser"
