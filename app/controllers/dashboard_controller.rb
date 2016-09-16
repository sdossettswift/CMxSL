class DashboardController < ApplicationController
  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

  def welcome
    @contacts = Contact.all.paginate(page: params[:page], per_page: 20)

    @lists = List.all.paginate(page: params[:page], per_page: 10)

    q = Contact.all
    @q = q.search params[:query] if params[:query].present?
  end
end
