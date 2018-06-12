class MagnetController < ApplicationController
  before_action:set_images

  def gallery

  end

  def upload
    @selected_images = params[:user][:selected_image_id]
    #save it in store table
    @selected_images.each do |imageId|
      if imageId!="0"
        store = Store.new
        store.Image_id = imageId
        store.user_id = session[:user]["id"]
        store.save
      end
    end

    #redirect to checkout page
    #add minimum cap of 8 images
  end

  private
  def set_images
    @response = []
    @response.push(Image.find_by(user_id:session[:user]["id"]))
  end

  def set_params
    params.permit(:selected_image_id,session[:user])
  end
end
