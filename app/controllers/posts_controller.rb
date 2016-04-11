class PostsController < ApplicationController
before_action :playerauthorise


def index
if params[:search]
@projects = Project.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
else
@posts= @current_player.posts.order('created_at DESC')
end

end
def new
@post= Post.new
end
def create
@post= Post.new(post_params)
@post.player_id = @current_player.id

if @post.save
	
redirect_to @post
else
render 'new'
end
end

def show
@post = Post.find(params[:id])
end

def edit
@post = Post.find(params[:id])
end
def update
@post = Post.find(params[:id])
if @post.update(params[:post].permit(:title, :body))
redirect_to @post
else
render 'edit'
end
end

def destroy
@post = Post.find(params[:id])
@post.destroy

redirect_to root_path
end
private
def post_params
params.require(:post).permit(:title, :body)
end
end
