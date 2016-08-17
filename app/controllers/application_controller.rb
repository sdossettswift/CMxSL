class ApplicationController < ActionController::Base
  before_action do
      @current_user = User.find_by id: session[:user_id]
  end
  protect_from_forgery with: :exception
end
