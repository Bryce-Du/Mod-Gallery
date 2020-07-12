class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        flash[:alert] = "Your comment failed to send." unless @comment.save
        redirect_to user_mod_path(params[:user_id], params[:mod_id])
    end
    def update
    end
    def destroy
        Comment.destroy(params[:id])
        redirect_to user_mod_path(params[:user_id], params[:mod_id])
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :mod_id, :content)
    end
end
