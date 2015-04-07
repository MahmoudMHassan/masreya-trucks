class PicturesController < ApplicationController
  def new
  #   @make = Make.find(params[:make_id])
    # Associate an item object with order 1
    #@picture= @make.pictures.build
     @picture = Picture.new
  end

  def create
     @picture = Picture.new(params.require(:picture).permit(:image))
      @picture.save
     
    # @make = Make.find(params[:make_id])

    # For URL like /orders/1/items
    # Populate an item associate with order 1 with form data
    # Order will be associated with the item
    #@picture = @make.pictures.build(params[:picture])
    #@picture.save
   # if @picture.save
      # Save the item successfully
   # else
     # render :action => "new"
   # end
  end

  def show
    @make = Make.find(params[:make_id])

    # For URL like /orders/1/items/2
    # Find an item in orders 1 that has id=2
    @picture = @make.pictures.find(params[:id])
  end
 
  def index
     @picture = Picture.find(params[:id])

    # Access all items for that order
    @ads = @picture.ads
  end
end
