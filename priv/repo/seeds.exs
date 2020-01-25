App.User.create(%{
  email: "admin@email.com",
  password: "12345678"
})

App.Database.create(%{
  type: "postgres",
  title: "DB Example",
  name: "db_example",
  host: "127.0.0.1",
  port: 5432,
  user: "user",
  password: "12345678"
})
