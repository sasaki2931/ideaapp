class ThemesController < ApplicationController
    def index
      @theme = Theme.all
    end

    def new
      @theme = Theme.new
    end

    def create
        Theme.create(theme_params)
        redirect_to themes_path
    end

    def update
    end


    def edit
    end

    def destroy
    end

    private

    def theme_params
        params.require(:theme).permit(:title,:content,reword.img)
    end

end
