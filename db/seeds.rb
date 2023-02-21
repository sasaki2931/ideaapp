labels = Label.create!([
  { name: 'デフォルト' },
  { name: '地域問題' },
  { name: 'スポーツ' },
  { name: '勉強' },
  { name: '趣味' }
])

20.times do |n|
  user = User.create!(
    name: "User#{n+1}",
    email: "user#{n+1}@example.com",
    password: "password",
    address: "Address#{n+1}"
  )
  theme = Theme.create!(
    title: "test#{n+1}",
    content: "test#{n+1}",
    reword: "test#{n+1}",
    img: File.open("./app/assets/images/wallpaperbetter (2).jpg"),
    user_id: user.id
  )
  theme.labels << labels.sample(rand(1..3))
end




