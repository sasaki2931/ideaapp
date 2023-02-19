Label.create!([
    {name:'地域問題'},
    {name:'スポーツ'},
    {name:'勉強'},
    {name:'趣味'}
])

20.times do |n|
    user = User.create!(
      name: "User#{n+1}",
      email: "user#{n+1}@example.com",
      password: "password",
      address: "Address#{n+1}"
    )
    Theme.create!(
      title: "test#{n+1}",
      content: "test#{n+1}",
      reword: "test#{n+1}",
      img: "test#{n+1}",
      user_id: user.id
    )
  end