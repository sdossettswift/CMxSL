class ListsController < ApplicationController
  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

  def new
      @lists = List.new
    end

    def create
      @lists=List.create(list_params)
      if @lists.save
        redirect_to dashboard_path, notice: "List Successfully Added"
      else
        render :new
      end
    end

    def index
      @lists = List.all
    end

    def show
      @lists = List.find_by id: params[:id]
      @contacts = @lists.contacts.paginate(page: params[:page], per_page: 20)
    end

    def edit
      @lists = List.find_by id: params[:id]
    end

    def update
      @lists = List.find_by id: params[:id]
      if @lists.update(list_params)
        redirect_to dashboard_path, notice: "List Details Successfully Updated"
      else
        render :edit
      end
    end

    def delete
        @lists = List.find_by id: params[:id]
        @lists.destroy
        redirect_to dashboard_path, notice: 'List Details Removed'
    end

    private

    def list_params
      params.require(:list).permit(:list_name, :description, :category, :status)
    end

end
