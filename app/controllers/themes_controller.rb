class ThemesController < ApplicationController
  
    before_action :set_blog, only: [:show, :edit, :update]
    def index
      @themes = Theme.all
      @themes = Theme.page(params[:page]).per(10)
    end

   def my_theme
    @theme = current_user.themes
   end


    

    def new
      @theme = Theme.new
    end

    def create
     @theme = Theme.new(theme_params)
     @theme = current_user.themes.build(theme_params)
       if @theme.save
         redirect_to themes_path, notice: "募集を開始しました！"
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
        redirect_to themes_path, notice: "ブログを編集しました！"
      else
        render :edit
      end
    end

    


    def edit
      
    end

    def destroy
        @theme.destroy
    end

    private

    def theme_params
        params.require(:theme).permit(:title,:content,:reword,:img,{ label_ids: []})
    end

    def set_blog
        @theme = Theme.find(params[:id])
    end

end
