class CommentsController < ApplicationController
    def create
        @blog = Blog.find(params[:blog_id])
        @comment = @blog.comments.create(params[:comment].permit(:body, :user_id))
        if @comment.save
            redirect_to commentshow_path(@blog.id ), notice: "comment added successfully"
        else
            redirect_to blog_path(@blog.id) , notice: "you can't submit empty comment"
        end 
    end

    def show
        @blog = Blog.find(params[:blog_id])                     
    end
    
    def collapse
        @obj = Comment.find(params[:param1])
        @obj.destroy
        redirect_to commentshow_path(blog_id: params[:param1])
        
    end

end
