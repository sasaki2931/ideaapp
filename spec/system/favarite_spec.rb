require 'rails_helper'

RSpec.describe 'お気に入り機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user, email: 'test2@example.com') }
  let!(:theme) { FactoryBot.create(:theme, user: user2) }
  before do
    visit root_path
    sign_in user
  end

  describe '新規お気に入り機能' do
    context '募集をお気に入りした場合' do
      it '登録したお気に入りが表示される' do
        visit theme_path(theme)
        click_link 'お気に入りする'
        expect(page).to have_content 'お気に入り登録しました'
      end
    end
  end
  describe '一覧機能' do
    context 'お気に入り一覧画面に移動した場合' do
      it 'お気に入りが表示される' do
        FactoryBot.create(:favorite, user: user, theme: theme)
        visit favorites_path
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end
  end
end