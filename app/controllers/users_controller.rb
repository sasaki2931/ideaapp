class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action :authenticate_user!
    def show
      return redirect_to root_path unless current_user.id ==  user.id
      @user_favorites = user.favorites
    end

    private
    def set_user
      @user = User.find(params[:id])
    end


end
