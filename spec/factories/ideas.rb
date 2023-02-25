FactoryBot.define do
    factory :idea do
      title { "example title" }
      content { "example content" }
      img { "example.jpg" }
      user
      theme
    end
end