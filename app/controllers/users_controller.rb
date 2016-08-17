class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    before_action do
      if @current_user.nil?
        redirect_to sign_in_path, alert: "Please Sign In"
      end
    end
    @users = User.all
  end


  def show
    before_action do
      if @current_user.nil?
        redirect_to sign_in_path, alert: "Please Sign In"
      end
    end
    @user = User.find_by id: params[:id]
  end

  def edit
    before_action do
      if @current_user.nil?
        redirect_to sign_in_path, alert: "Please Sign In"
      end
    end
    @user = User.find_by id: params[:id]
  end


  def create
   @user = User.create(user_params)
     if @user.save
       # we should also sign them in
       session[:user_id] = @user.id
       redirect_to dashboard_path, notice: "Welcome!"
     else
       render :new
     end
   end

def update
  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    else
  end
  @user = User.find_by id: params[:id]
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "Profile Updated!"
    else
      render :edit
    end
end

  private
  def user_params
    params.require(:user).permit(:username,:password, :password_confirmation, :email, :password_digest)
  end
end
