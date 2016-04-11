class CommentsController < ApplicationController
before_action :coachauthorise
def new
@comment= Comment.new
end

def create
	@post = Post.find params[:post_id]
	@comment = @post.comments.new(comment_params)
	@comment.name = @current_coach.name
	@comment.save

    respond_to do |format|
		format.html{redirect_to playerdiary_path}
    end
  end

def show
@comment = Comment.find(params[:id])
end

def edit
@comment = Comment.find(params[:id])
end
def update
@xomment = Comment.find(params[:id])
if @comment.update(params[:comment].permit(:name, :body))
redirect_to @comment
else
render 'edit'
end
end


def destroy
@comment = Comment.find(params[:id])
@comment = @post.comments.find(params[:id])
@comment.destroy

redirect_to comment_path(@comment)
end

private
	def comment_params
		params.require(:comment).permit(:name, :body)
	end
end
