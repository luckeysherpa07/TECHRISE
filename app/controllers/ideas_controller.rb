class IdeasController < ApplicationController
    def index
        @ideas = Idea.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
        
    end
    
    def create
        @idea = Idea.create(idea_params)
        if @idea.valid?
            flash[:success] = "Your idea has been posted!"
        else
            flash[:alert] = "Woops! Seems like there's an error."
        end
        redirect_to root_path
    end
    
    def edit
        @idea = Idea.find(params[:id])
    end
    
    def update
        @idea = Idea.find(params[:id])
        if @idea.update(idea_params)
            flash[:success] = "Your idea has be updated!"
            redirect_to root_path
        else
            flash[:alert] = "Opps! There's an error."
            redirect_to edit_idea_path(params[:id])
        end
    end
    
    def destroy
        @idea = Idea.find(params[:id])
        @idea.destroy
        flash[:success] = "Your idea has been deleted."
        redirect_to root_path
    end
    
    private
    
    def idea_params
        params.require(:idea).permit(:description, :author)
    end

end
