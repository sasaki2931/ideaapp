class IdeasController < ApplicationController
    def create
        @theme = Theme.find(params[:theme_id])
        @idea = Idea.new(idea_params)
        @idea.user_id = current_user.id
        @idea.post_id = @idea.id
        @idea.save
    end

    def destroy
        @theme = theme.find(params[:post_id])
        @theme_ideas = @theme.ideas
        Idea.find_by(id: params[:id], theme_id: params[:theme_id]).destroy
    end

    private

    def idea_params
      params.require(:idea).permit(:title,:content,img)
    end
end
