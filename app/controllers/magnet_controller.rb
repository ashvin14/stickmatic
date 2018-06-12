class MagnetController < ApplicationController
  before_action:set_images

  def gallery

  end

  private
  def set_images

    @images = HTTP.get('https://api.instagram.com/v1/users/self/media/recent/?access_token='+ session[:access_token]).body
    
  end



end
