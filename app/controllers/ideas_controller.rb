class IdeasController < ApplicationController
    def index
        @ideas = Idea.all.includes(:theme)
        @theme = Theme.find(params[:theme_id])
    end

    def create
        @theme = Theme.find(params[:theme_id])
        @idea = Idea.new(idea_params)
        @idea.user_id = current_user.id
        @idea.theme_id = @theme.id
        if @idea.save
            redirect_to theme_ideas_path(@theme)
        else
            render 'new'
        end
    end

    def new
        @theme = Theme.find(params[:theme_id])
        @idea = @theme.ideas.build
    end

    def edit
        @theme = Theme.find(params[:theme_id])
        @idea = Idea.find(params[:id])
    end

    def destroy
        @theme = theme.find(params[:post_id])
        @theme_ideas = @theme.ideas
        Idea.find_by(id: params[:id], theme_id: params[:theme_id]).destroy
    end

    private

    def idea_params
      params.require(:idea).permit(:title,:content,:img)
    end
end
