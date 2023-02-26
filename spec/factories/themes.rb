FactoryBot.define do
  factory :theme do
    title { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    reword { 'デフォルト1' }
    img { 'デフォルト1' }
    association :user

    after(:build) do |theme|
      label = create(:label)
      theme.labellings << build(:labelling, theme: theme, label: label)
    end

  end

  factory :second_theme, class: Theme do
    title { 'Factoryで作ったデフォルトのタイトル２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    reword { 'デフォルト2' }
    img { 'デフォルト2' }
    association :user
  end
end


