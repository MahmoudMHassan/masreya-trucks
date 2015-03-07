class HeavytrucksController < ApplicationController
  def new
    @heavytruck=Heavytruck.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  def show
  end

  def index
    @heavytrucks=Heavytruck.all
  end
end
