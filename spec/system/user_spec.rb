require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe '新規ユーザー登録' do
     context '新規ユーザを登録した場合' do
       it '登録ユーザの詳細が表示される' do
          visit new_user_registration_path
          fill_in 'user[name]', with: 'sasakiname'
          fill_in 'user[email]', with: 'sasaki@gmail.com'
          fill_in 'user[password]', with: 'sasakisasaki'
          fill_in 'user[password_confirmation]', with: 'sasakisasaki'
          fill_in 'user[address]', with: 'sasakisaskisasaki'
          click_on 'Sign up'
          expect(page).to have_content 'sasaki@gmail.com'
          expect(page).to have_content 'のページ'
       end
      end
    end
  describe "ログイン機能" do
    let!(:user){ FactoryBot.create(:user)}
    context "ユーザーがログインする場合" do
      it "ログインができる" do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test@test.com'
        fill_in 'user[password]', with: 'testtest'
        click_on 'Log in'
        expect(page).to have_content "のページ"
      end
    end
    context "ログインせずにタスク一覧に飛ぼうとした場合" do
      it "ログイン画面に移行する" do
        visit themes_path
        expect(page).to have_content "Log in"
      end
    end
    context 'ゲストがログインした場合' do
        it '一覧ページににアクセスできる' do
          visit root_path
          click_on 'ゲストログイン（閲覧用）'
          expect(page).to have_content '募集一覧'
        end
    end
  end  
    describe "管理者機能" do
        context "管理者がログインする場合" do
          it '管理者画面に行ける' do
            visit root_path
            click_on 'ゲストログイン（管理者用）'
            click_on '管理者ページへ'
            expect(page).to have_content "Ideaapp", wait: 5
          end
        end
    end
    describe "ログアウト" do
        context "ユーザ-がログインする場合" do
          it 'ログアウトができる' do
            visit root_path
            click_on 'ゲストログイン（管理者用）'
            click_on "ログアウト"
            expect(page).to have_content 'ログイン'
          end
        end
    end
end

    