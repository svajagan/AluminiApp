class MessagesController < ApplicationController
 
 before_filter :get_message_object, :only=>[:show, :edit, :destroy,:update]
 before_filter :check_logged_in, :only =>
 [:edit,:destroy,:new,:create,:update]
 before_filter :check_user, :only =>
 [:edit,:update]
 
 private
 
 def get_message_object
  @message = Message.find_by_id(params[:id])
  if @message.nil?
    flash[:notice]="Sorry no message was found"
    redirect_to messages_path and return
  end 
 end
 
 def check_user
    if current_user != @message.user
        flash[:error] = "Sorry, The function cannot be performed!"
     redirect_to messages_path and return
    end
 end
 public
 
 def index
   @messages = Message.all
   
 end
 
 def new
  @message = Message.new
 end
 
 def edit
 end
 
 def show
  @commentable = @message
  @comments = @commentable.comments
  @comment = Comment.new
 end
 
 def update
   if @message.update_attributes(params[:message])
    flash[:notice]="Congrats!!! Your changes to the message has been successfully updated"
    redirect_to message_path(@message)
  else
   flash[:error]="Sorry !! Unable to save your changes"
   render :action =>:edit
  end
  
 end
 
 def create
  @message = Message.new(params[:message])
  @message.user_id = current_user.id
  if @message.save
    flash[:notice]="Congrats!!! Your message has been saved Successfully"
    redirect_to messages_path
  else
   flash[:error]="Sorry !! Unable to save your Massage"
   render :new   
  end
 end
end
