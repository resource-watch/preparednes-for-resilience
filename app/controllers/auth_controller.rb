class AuthController < ApplicationController

  def login
    token = params[:token]
    if token.nil?
      redirect_to_apigateway
    else
      session[:user_token] = token
      redirect_to admin_root_path
    end
  end

  def logout
    session[:user_token].destroy
    session[:current_user].destroy
    logout_apigateway
  end

end
