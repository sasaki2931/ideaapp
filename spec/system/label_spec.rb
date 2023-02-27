require 'rails_helper'

RSpec.describe 'ラベル機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:theme) { FactoryBot.create(:theme, user: user) }
  before do
    visit root_path
    sign_in user
  end
  describe '新規作成機能' do
    context '募集を新規作成した場合' do
      it '作成したラベルが表示される' do
        visit new_theme_path
        fill_in 'theme[title]', with: 'test'
        fill_in 'theme[content]', with: 'test'
        fill_in 'theme[reword]', with: '2011-01-01'
        check "デフォルト" 
        click_button '登録する'
        expect(page).to have_content 'デフォルト'
      end
    end
  end
  describe '検索機能' do
    context 'ラベルで検索した場合' do
      it 'ラベルに完全一致するタスクが絞り込まれる' do
        visit themes_path
        sleep(30)
        check "q[labels_id_eq_any][]"
        click_button '検索'
        expect(page).to have_content 'デフォルト'
      end
    end
  end
end




