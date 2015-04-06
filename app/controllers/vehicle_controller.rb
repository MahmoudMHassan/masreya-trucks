class VehicleController < ApplicationController
  def create
  end

  def destroy
  end

  def index
    @vehicles = Vehicle.all
  end

  def edit
  end

  def new
    @vehicle = Vehicle.new
  end
end
