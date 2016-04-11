class SessionsController < ApplicationController
	
	def playernew
  
	end

  def playercreate
  
	player = Player.find_by_name(params[:name])
	if player && player.authenticate(params[:password])
	
		session[:player_id] = player.id
		redirect_to player
		
	else
	
		flash.now[:error]= "Invalid name/password combination"
		render 'playernew'
	end
   end

  def playerdestroy
	if playersigned_in?
		session[:player_id] = nil
	else
		flash[:notice] = "You need to sign in first"
	end
	redirect_to root_path
  end


  def coachnew
  
  end

  def coachcreate
	coach = Coach.find_by_name(params[:name])
	if coach && coach.authenticate(params[:password])
		session[:coach_id] = coach.id
		redirect_to playerdiary_path
	else
		flash.now[:error]= "Invalid name/password combination"
		render 'coachnew'
	end
  end

  
  def coachdestroy
	if coachsigned_in?
		session[:coach_id] = nil
	else
		flash[:notice] = "You need to sign in first"
	end
	redirect_to root_path
  end

end
