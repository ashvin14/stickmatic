class MagnetController < ApplicationController
  before_action:authenticate_user!
  before_action:set_images

  def gallery

  end

  def upload
    @selected_images = params[:user][:selected_image_id]
    #save it in store table
    @selected_images.delete("0")
    if !@selected_images.empty?
      @selected_images.each do |imageId|
        store = Store.new
        store.Image_id = imageId
        store.user_id = session[:user]["id"]
        if store.save
          flash[:notice] = "Images selected for order"
          redirect_to checkout_path
        else
          redirect_to magnet_upload_path
        end
      end
    else 		
      flash[:alert] = "You have to select atleast 1 Image"
      redirect_to magnets_upload_path
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
