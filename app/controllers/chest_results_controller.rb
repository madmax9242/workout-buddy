class ChestResultsController < ApplicationController
	def index
    	@chest_results = Chest_Result.all
  	end

    def show
      @chest_results = Chest_Result.all
      respond_to do |format|
        format.html
        format.json { render :json => @chest_results.to_json }
      end
    end

  	def create
    @chest_result = Chest_Result.new(chest_params)
    @chest_result.user_id = current_user.id

    respond_to do |format|
      if @chest_result.save
        format.html { redirect_to :users, notice: 'Workout was successfully logged.' }
        format.json { render :show, status: :created, location: @chest_result }
      else
        format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  	def new
		@chest_result = Chest_Result.new
	end

	private
		def chest_params
	      params.require(:chest_result).permit(:flat_press,:incline_press,:cable_fly,:decline_press, :incline_fly, :stablization_pushup)
	    end


end