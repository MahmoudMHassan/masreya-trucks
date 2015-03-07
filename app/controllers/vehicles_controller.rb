class VehiclesController < ApplicationController
  def index
    @vehicles=Vehicle.all
  end

  def new
    @vehicle=Vehicle.new
  end

  def create
  end

  def show
  end

  def delete
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
