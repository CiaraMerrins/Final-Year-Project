module ApplicationHelper
	def playersigned_in?
		if session[:player_id].nil?
			return
		else
			@current_player = Player.find_by_id(session[:player_id])

		end
	end

	def coachsigned_in?
		if session[:coach_id].nil?
			return
		else
			@current_coach = Coach.find_by_id(session[:coach_id])

		end
	end
end
