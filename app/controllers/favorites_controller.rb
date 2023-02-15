class FavoritesController < ApplicationController
    def create
      favorite = current_user.favorites.create(theme_id: params[:theme_id])
      redirect_to themes_path, notice: "#{favorite.theme.user.name}さんのブログをお気に入り登録しました"
    end
    
    def destroy
      favorite = current_user.favorites.find_by(id: params[:id]).destroy
      redirect_to themes_path, notice: "#{favorite.theme.user.name}さんのブログをお気に入り解除しました"
    end
end
