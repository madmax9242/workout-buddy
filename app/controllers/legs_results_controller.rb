class LegsResultsController < ApplicationController
	def index
    	@legs_results = Legs_Result.all
      respond_to do |format|
        format.html
        format.json { render :json => @legs_results.to_json }
      end
  	end

    def show
      @legs_results = Legs_Result.all
      respond_to do |format|
        format.html
        format.json { render :json => @legs_results.to_json }
      end
    end

  	def create
    @legs_result = Legs_Result.new(legs_params)

    respond_to do |format|
      if @legs_result.save
        format.html { redirect_to :users, notice: 'Workout was successfully logged.' }
        format.json { render :show, status: :created, location: @legs_result }
      else
        format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  	
  	def new
		@legs_result = Legs_Result.new
	end


	private
		def legs_params
	      params.require(:legs_result).permit(:back_squat,:calf_raises,:leg_press,:leg_curls,:leg_extensions, :lunges)
	    end

end