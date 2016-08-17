class ListsController < ApplicationController
  def new
      @list = List.new
    end

    def create
      @list=List.create(list_params)
      if @list.save
        redirect_to dashboard_path, notice: "List Successfully Added"
      else
        render :new
      end
    end

    def index
      @lists = List.all
    end

    def show
      @list = List.find_by id: params[:id]
    end

    def edit
      @list = List.find_by id: params[:id]
    end

    def update
      @list = List.find_by id: params[:id]
      if @list.update(list_params)
        redirect_to dashboard_path, notice: "List Details Successfully Updated"
      else
        render :edit
      end
    end

    def delete
        @list = List.find_by id: params[:id]
        @list.destroy
        redirect_to dashboard_path, notice: 'List Details Removed'
    end

    private

    def list_params
      params.require(:list).permit(:list_name, :description, :category, :status)
    end

end
