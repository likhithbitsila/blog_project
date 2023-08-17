class BlogsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
#  if current_user.id ==  user_id 
#   before_action [:edit]
#  end
  before_action :set_blog, only: %i[ show edit update destroy ]
 

  # def d_down
  #   @blog = Blog.order(:title)
  #   puts "action dropdown"
  #   redirect_to root_path
  # end

  # GET /blogs or /blogs.json

  def first
  end

  def index
    
    @blog = Blog.all.order(params[:filter])    

    @a = User.all

  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @ul = Like.find_by(blog_id: params[:id], user_id: current_user.id)
    @total_likes = Like.where(ref_id: 1, blog_id: params[:id]) 
  end


  # GET /blogs/new
  def new  
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.title = @blog.title.capitalize
    @blog.author = @blog.title.capitalize

      if @blog.save
          redirect_to blogs_path, notice: "new voter has been added successfully"
      else
          render :new ,status: :unprocessable_entity
      end 
  end



  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    if user_signed_in?
      if @blog.update(blog_params)
        redirect_to blogs_path , notice: "new voter has been edited successfully"
      else 
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
      redirect_to blogs_path
  end

def id_pass
  @users = User.all

end 


def search
  if params[:query].strip != ""
    @blog = Blog.where("blogs.title LIKE ?","%" + params[:query] + "%").order(title: :desc)
 

  else
    @blog=[]
  end
end
 
def my_blog
  @blog = Blog.where(user_id: current_user.id )
end

def like

    @a = current_user.id
    @b = Blog.find(params[:param1])
    
    @like = Like.find_by(user_id: @a , blog_id: @b.id)

    if @like.class == NilClass
      Like.create(user_id: @a , blog_id: @b.id, ref_id: 1)
    elsif @like.ref_id == 1
      @like.update(ref_id: 0)
    else
      @like.update(ref_id: 1)
    end
    redirect_to blog_path(@b.id)
    
end

def mylike
  @my =   Like.select(:blog_id).where(user_id: current_user.id ,ref_id: 1)
 
 
  @mylike = Blog.where(id: @my)
 


 
  # @mylike = Blog.where(params[:bl] )
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:author, :authors_email, :title, :desciption, :pages, :release_date, :user_id )
    end
end
