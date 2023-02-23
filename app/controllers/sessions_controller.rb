class SessionsController < Devise::SessionsController
    def new_guest
        user = User.guest
        sign_in user   
        redirect_to themes_path, notice: 'ゲストユーザーとしてログインしました。'
    end

    def admin_guest
        user = User.guest_admin
        sign_in user   
        redirect_to themes_path, notice: 'ゲストユーザー(管理者)としてログインしました。'
    end
end
