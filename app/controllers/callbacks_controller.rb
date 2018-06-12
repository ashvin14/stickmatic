require "http"

class CallbacksController < Devise::OmniauthCallbacksController
  def instagram
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user] = @user
    session[:access_token] = request.env["omniauth.auth"]["credentials"]["token"]
    redirect_to  magnets_upload_path

  end



  def failure
    redirect_to root_path
  end

  def passthru
    puts params
    session[:access_token] = params[:authenticity_token]
    redirect_to user_instagram_omniauth_authorize_path
  end


  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  private
  def from_user_instagram(ssession)
    url = "https://api.instagram.com/v1/tags/nofilter/media/recent?access_token="
    resp = HTTP.get(url + session[:access_token]).body
    puts resp

  end


end
