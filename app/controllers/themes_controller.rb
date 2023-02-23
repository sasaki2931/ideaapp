class ThemesController < ApplicationController
    before_action :set_theme, only: [:show, :edit, :update,:destroy]
    def index
      @search = Theme.ransack(params[:q])
      @themes =@search.result.includes(:user).page(params[:page]).per(10)
    end

   def my_theme
    @themes = Theme.where(user_id: current_user.id).includes(:user).order("created_at DESC").page(params[:page]).per(10)
   end

    def new
      @theme = Theme.new
    end

    def create
     @theme = Theme.new(theme_params)
     @theme.user_id = current_user.id
     if @theme.save
         redirect_to theme_path(@theme), notice: "募集を開始しました！"
       else
         render :new
       end
    end

    def show
      @favorite = current_user.favorites.find_by(theme_id: @theme.id)
      @idea = Idea.new
      @theme_ideas = @theme.ideas
    
    end

    def update
      if @theme.update(theme_params)
        redirect_to my_theme_path, notice: "募集を編集しました！"
      else
        render :edit
      end
    end


    def edit
      
    end

    def destroy
        @theme.destroy
        redirect_to my_theme_path, notice: "募集を削除しました"
    end

    def send_email
      selected_idea_ids = params[:idea_ids]
      selected_ideas = Idea.where(id: selected_idea_ids, theme_id: params[:id])
      UserMailer.send_ideas_email(selected_ideas).deliver_now
      redirect_to themes_path, notice: "メールを送信しました"
    end

    private

    def theme_params
        params.require(:theme).permit(:title,:content,:reword,:img,:image_cache,{ label_ids: []})
    end

    def set_theme
        @theme = Theme.find(params[:id])
    end

end
