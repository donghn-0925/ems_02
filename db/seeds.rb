User.create!(fullname: "Đây là admin!",
  email: "admin@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:admin],
  create_by: nil)
User.create!(fullname: "Đây là trainee!",
  email: "trainee@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:trainee],
  create_by: nil)
User.create!(fullname: "Đây là supervisor!",
  email: "sup@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:supervisor],
  create_by: nil)    
User.create!(fullname: "Đây là trainee! 1",
  email: "trainee@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:trainee],
  create_by: nil)
User.create!(fullname: "Đây là trainee! 2",
  email: "trainee@mail.com",
  password: "123123",
  password_confirmation: "123123",
  role: User.roles[:trainee],
  create_by: nil)
