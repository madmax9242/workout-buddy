class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @home_pic_array = ['http://i.imgur.com/AIRwlFc.gif', 'http://www.funnyjunksite.com/pictures/funnypics/sport/weight_lifting/funny_weight_lifting_picture_11.jpg', 'http://www.pacificridgeclothing.com/designs/2011/Z12090/Z12090.jpg', 'http://i1015.photobucket.com/albums/af273/Chapa37/gif/celebrity-gifs-brad-pitt-workout.gif', 'http://www.bettycjung.net/BG2013/dogsquats', 'http://33.media.tumblr.com/4eea5ddf921a179c0f771475ee591ad6/tumblr_mf5x5skvBv1r5yiuao1_500.gif', 'http://img0.joyreactor.com/pics/post/gif-gym-Cyanide-%26-Happiness-comics-883866.gif', 'http://www.funnfun.in/wp-content/uploads/2013/10/treadmill-workouts-of-funny-dogs-funny-gif.gif', 'http://animationsa2z.com/attachments/Image/animals/animals17.gif', 'http://funnyasduck.net/wp-content/uploads/2012/11/funny-dog-walk-lying-down-exercise-hard-carry-me-leash-lead-pics.jpg', 'http://www.vitamin-ha.com/wp-content/uploads/2013/08/Funny-Gym-and-Workout-21.jpg', 'http://fitnessmotivationalquotes.com/wp-content/uploads/2012/04/Zombie.jpg']
    @home_pic = @home_pic_array.sample
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        auto_login(@user)
        format.html { redirect_to :users, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
