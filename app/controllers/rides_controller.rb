class RidesController < ApplicationController

  def create
      @ride = Ride.create
      redirect_to user_path(@user)
  end


end
