class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    # user can't see this if not logged in
    @user = User.find(params[:id])
    ride = Ride.new
  
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end








end
