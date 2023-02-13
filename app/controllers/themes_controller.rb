class ThemesController < ApplicationController
    def index
      @theme = Theme.all
    end

    def new
      @theme = Theme.new
    end

    def create
    end

    def update
    end


    def edit
    end

    def destroy
    end


end
