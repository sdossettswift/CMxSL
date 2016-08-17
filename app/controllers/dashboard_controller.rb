class DashboardController < ApplicationController
  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

  def welcome
    @contacts = Contact.all
    @lists = List.all
  end
end
