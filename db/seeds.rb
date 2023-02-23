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

Theme.all.each do |theme|
  rand(5..8).times do |n|
    idea = Idea.create!(
      title: "アイデア#{n+1}",
      content: "詳しく#{n+1}",
      img: 'https://example.com/img/idea.jpg',
      theme: theme,
      user: User.order('RANDOM()').first
    )
  end
end
User.all.each do |user|
  rand(5..8).times do |n|
    favorit = Favorite.create!(
      theme: Theme.order('RANDOM()').first,
      user: user
    )
  end
end






