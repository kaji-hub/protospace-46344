class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:comment][:prototype_id])
    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      render 'prototypes/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :prototype_id).merge(user_id: current_user.id)
  end
end
