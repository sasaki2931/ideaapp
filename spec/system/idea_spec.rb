require 'rails_helper'
RSpec.describe 'アイデア送信管理機能', type: :system do
    let(:user) {FactoryBot.create(:user)}
    let(:user2) {FactoryBot.create(:user2)}
    let(:theme) {FactoryBot.create(:theme,user: user2)}
    before do
        visit root_path
        sign_in user
    end
    describe 'アイデア投稿機能' do
        context 'アイデアを投稿した場合' do
          it '作成したアイデアが表示される' do
            visit theme_path(theme)
            click_on '参加する'
            fill_in'idea[title]',with:'test'
            fill_in'idea[content]',with:'test'
            click_button'登録する'
            expect(page).to have_content 'test'
          end
        end
    end
    describe '詳細表示機能' do
      context '一覧画面に遷移した場合' do
        it '作成済みのアイデア一覧が表示される' do
          theme = FactoryBot.create(:theme, user: user)
          idea = FactoryBot.create(:idea,theme: theme, user: user)
          visit theme_ideas_path(theme)
          expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
        end
        it '募集の詳細を見れる' do
          theme = FactoryBot.create(:theme, user: user2)
          idea = FactoryBot.create(:idea,theme: theme, user: user)
          visit theme_ideas_path(theme)
          click_link "募集詳細"
          expect(page).to have_content 'デフォルト1'
        end
      end  
    end
end
