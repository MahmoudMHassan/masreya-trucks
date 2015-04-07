class MakesController < ApplicationController
  def new
    @make = Make.new
    @make.ad = Ad.new
    @make.vehicle = Vehicle.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def delete
  end

  def destroy
  end

  def index
    @makes = Make.all
  end

  def create
    @make = Make.new(params.require(:make).permit(:purchase, :new, :imported, ad_attributes: [:id,:title, :description]))
  end

end
