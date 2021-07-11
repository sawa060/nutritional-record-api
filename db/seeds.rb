if Rails.env.development?
  user_params = {
    name: 'テストユーザー',
    email: 'test@test.jp'
    password: 'Test1234'
  }
  user = user.build(user_params)
  user.save!
end
