class CommentsController < ApplicationController
  
  before_filter :load_commentable
  
  private
  
  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable =    resource.singularize.classify.constantize.find(id)
  end
  
  public
  
  
  
  def create
     @comment = @commentable.comments.new(params[:comment])
      @comment.user_id = current_user.id
     if @comment.save
      flash[:notice]="Successfully added the new comment"
      redirect_to @commentable
     else
      flash[:notice]="Sorry!! Unable to Post your Comment"
      render :new
     end   
  end
  
end
