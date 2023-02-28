labels = Label.create!([
  { name: 'デフォルト' },
  { name: '地域問題' },
  { name: 'スポーツ' },
  { name: '勉強' },
  { name: '趣味' }
])

User.create!(
  [
    {name: "ikeda", email:"ikeda@example.com",password:"ikedaikeda",address:"岩手"},
    {name: "john", email:"john@example.com",password:"johnjohn",address:"岩手"},
    {name: "satou", email:"satou@example.com",password:"satousatou",address:"岩手"},
    {name: "ueda", email:"ueda@example.com",password:"uedaueda",address:"岩手"},
    {name: "nakatani", email:"nakatani@example.com",password:"nakatani",address:"岩手"},
    {name: "kawamura", email:"kawamura@example.com",password:"kawamura",address:"岩手"}
  ]
)

Theme.create!(
  [
    {title: "助けて",content:"卒業アプリ案",reword:"ギフトカード", user_id: 1},
    {title: "急募",content:"人口減少解決策",reword:"なし", user_id: 2},
    {title: "急いで",content:"卒論アイデア",reword:"スマイル", user_id: 3},
    {title: "ヘルプ",content:"作文アイデア",reword:"ギフトカード", user_id: 4},
    {title: "助けて",content:"劇アイデア", reword:"ギフトカード",user_id: 5},
    {title: "急募", content:"今日の晩御飯",reword:"ギフトカード",user_id: 6}
  ]
)
 Idea.create!(
  [
    {title: "筋肉",content:"なんとかなるよ", theme_id: 1,user_id: 2},
    {title: "パワー",content:"時間が解決する", theme_id: 2,user_id: 3},
    {title: "力",content:"ファイト", theme_id: 3,user_id: 4},
    {title: "脳筋", content:"頑張れ",theme_id: 4,user_id: 5,},
    {title: "パワー",content:"がんば", theme_id: 5,user_id: 6},
    {title: "脳筋", content:"どうにかなる",theme_id: 6,user_id: 1}
  ]
)