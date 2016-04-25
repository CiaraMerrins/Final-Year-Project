class PinsController < ApplicationController
before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
before_action :playerauthorise


def index
@pins= Pin.all.order("created_at DESC")
end
def show
end

def new
@pin = Pin.new
end

 def create
@pin= Pin.new(pin_params)
@pin.player_id = @current_player.id

if @pin.save
	
redirect_to @pin

else
render 'new'
end
end

def edit
end

def update
if @pin.update(pin_params)
redirect_to @pin, notice: "Pin was successfully updated!"
else
render 'edit'
end
end

def destroy
@pin.destroy
redirect_to root_path
end

#def upvote
#@pin.upvote_by @current_player
#redirect_to :back
#end

#def upvote
 # @pin = Pin.find(params[:id])
  #if @current_player.voted_for? @pin
   # redirect_to pins_path
  #else
   # @pin.upvote_by @current_player
    #@pin.player.increase_karma
   # redirect_to pins_path
  #end
#end



def upvote
  @pin = Pin.find(params[:id])
  @pin.upvote_by @current_player
 redirect_to pins_path
end

#def upvote
#@pin.upvote_by @current_player
#redirect_to :back
#end
def downvote
  @pin = Pin.find(params[:id])
  @pin.downvote_by @current_player
 redirect_to pins_path
end

#def downvote
 # @pin = Pin.find(params[:id])
  #if @current_player.voted_for? @pin
   # redirect_to pins_path
  #else
   # @pin.downvote_by @current_player
    #@pin.player.decrease_karma
    #redirect_to root_path
  #end
#end


private
def pin_params
params.require(:pin).permit(:title, :desciption, :image_file_name)
end
def find_pin
@pin = Pin.find(params[:id])
end
end
