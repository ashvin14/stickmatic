class CheckoutController < ApplicationController
  before_action:authenticate_user!

  def index
    @selected_images = []
    @selected_images.push Store.find_by(user_id:session[:user]["id"]).Image

  end
end
