class MakesController < ApplicationController
  def new
    @make = Make.new
    @make.ad = Ad.new
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
  end

  def create
    @make = Make.new(params.require(:make).permit(:purchase, :new, :imported, ad_attributes: [:id,:title, :description]))
  end

end