class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
before_action :playerauthorise, only: [:coachesschedule, :onesection]
  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end
  def coachesschedule
@coach = @current_player.coach
	
	@sections = Section.all
	
  end
  
    def onesection
	@section = Section.find(params[:section_id])
	
	@schedules = @section.schedules
	@ccschedules = Array.new
	@schedules.each do |s|		
		if s.coach.id == @current_player.coach.id
			@ccschedules << s
		end
	end
	@ccschedules
  end
  
  def oneplayer
	@player = Player.find(params[:player_id])
	@posts = @player.posts('created_at DESC')
  end
  
  # GET /players/1
  # GET /players/1.json
  def show
  #@player = Player.find(params[:id])
	if @player.bmi < 15
		@success = "* Very Severely Underweight *"
		
		elsif
		@player.bmi >= 15 && @player.bmi <16
		@success = "* Severely Underweight* "
		
		elsif
		@player.bmi >= 16 && @player.bmi <18.5
		@success = "* Underweight* "
		
		elsif
		@player.bmi >= 18.5 && @player.bmi <25
		@success = "* Normal (healthy weight)* "
		
		elsif
		@player.bmi >= 25 && @player.bmi <30
		@success =  "* Overweight* "
		
		elsif
		@player.bmi >= 30 && @player.bmi <35
		@success = "* Obese (Moderately)* "
		
		elsif
		@player.bmi >= 35 && @player.bmi <40
		@success = "* Obese (Severely)* "
		
		elsif
		@player.bmi >= 40
		@success = "* Obese (Very severely)* "
		
		end
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
	  
      if @player.save
	    Player.calculateBMI(@player)
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
	  
      if @player.update(player_params)
	    Player.calculateBMI(@player)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :email, :password, :password_confirmation, :image, :gender, :dob, :sport1_id, :sport2_id, :agegroup, :coach_id, :height, :weight, :bmi)
    end
end
