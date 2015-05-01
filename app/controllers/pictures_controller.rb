class PicturesController < ApplicationController
  def new
  #   @make = Make.find(params[:make_id])
    # Associate an item object with order 1
    #@picture= @make.pictures.build
     @picture = Picture.new
  end

  def create
    @picture = Picture.new(params.require(:picture).permit(:name, :ad_id))
    #@picture = Picture.find(params
     @picture.save
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
  
     def update
     @post_attachment.update(post_attachment_params)
  end
end
