#นายพริษฐ์พันธุ์ พันธุ์ศิริ 5410610215
#นายศุภณัฐ เลิศการณ์ 5410610165
class PostsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

def index
  @posts = Post.all
end

def new  #show screen to save post
 @post = Post.new
end

def create   #method create for save data into list
  @post = Post.new(params[:post].permit(:title, :text))
 
  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end


def edit
  @post = Post.find(params[:id])
end

def update  #method update for edit data in list
  @post = Post.find(params[:id])
 
  if @post.update_attributes(params[:post].permit(:title, :text))
    redirect_to @post
  else
    render 'edit'
  end
end
 

def show   #method show for show data from list
  @post = Post.find(params[:id])
end

def destroy  #method destroy for delete data in list
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end

private   #allows us to accept both title and text in this action.
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
