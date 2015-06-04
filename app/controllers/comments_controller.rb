class CommentsController < ApplicationController
  before_action :require_user

  def create
    @complaint = Complaint.find_by slug: params[:complaint_id]
    @comment = @complaint.comments.build(params.require(:comment).permit(:body))
    
    if current_user.is_a? Admin
      @comment.admin = current_user
    else
      @comment.user = current_user
    end

    if @comment.save
      flash[:success] = "Your comment was added."
      redirect_to complaint_path(@complaint)  
    else
      render 'complaints/show'
    end
  end
end