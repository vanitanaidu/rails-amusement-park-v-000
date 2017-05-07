class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
      @user = User.find_by(name: params[:sessions][:name])
      if @user.authenticate(params[:sessions][:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        render :new
      end

  end

  def show
    redirect_to @user
  end

  def destroy
    # binding.pry
    session.destroy
    redirect_to root_path
  end




end
