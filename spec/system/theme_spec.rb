require 'rails_helper'
RSpec.describe '募集管理機能', type: :system do
    let(:user) {FactoryBot.create(:user)}
    
    before do
        visit root_path
        sign_in user
    end
    describe '新規作成機能' do
        context '募集を新規作成した場合' do
            it '作成した募集が表示される' do
          visit new_theme_path
          fill_in'theme[title]',with:'test'
          fill_in'theme[content]',with:'test'
          fill_in'theme[reword]',with:'test'
          check 'theme_label_ids_1'
          click_button'登録する'
          expect(page).to have_content 'test'
        end
      end
    end
    describe '一覧表示機能' do
      context '一覧画面に遷移した場合' do
        it '作成済みのタスク一覧が表示される' do
          theme = FactoryBot.create(:theme, user: user)
          visit themes_path
          expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
        end
      end
    end
      context '募集が作成日時の降順に並んでいる場合' do
        it '新しいタスクが一番上に表示される' do
          new_theme = FactoryBot.create(:theme, user: user, title: '新しい募集')
          visit themes_path
          theme_list = all('.theme_row') 
          expect(theme_list[0]).to have_content '新しい募集'
        end
      end
    end
    describe '詳細表示機能' do
      context '任意の募集詳細画面に遷移した場合' do
        it '該当タスクの内容が表示される' do
          theme = FactoryBot.create(:theme, user: user)
          visit theme_path(theme.id)
          expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
        end
      end
    end
    describe 'メール送信機能' do
      context '自分が投稿した募集詳細画面に遷移した場合' do
        it '該当募集の内容が表示される' do
          new_theme = FactoryBot.create(:theme, user: user, title: '新しい募集')
          theme = FactoryBot.create(:theme, user: user)
          idea = FactoryBot.create(:idea, theme: theme, user: user)
          visit my_theme_path(theme.id)
          expect(page).to have_content theme.title
        end
      end
      context 'アイデアを選択した場合メールが送信される' do
        it '該当募集のアイデアが表示される' do
          new_theme = FactoryBot.create(:theme, user: user, title: '新しい募集')
          theme = FactoryBot.create(:theme, user: user)
          idea = FactoryBot.create(:idea, theme: theme, user: user)
          visit my_theme_path(theme.id)
          check "idea_ids_#{idea.id}"
          click_on '採用'
          expect(page).to have_content 'メールを送信しました'
        end
      end
    end
end
