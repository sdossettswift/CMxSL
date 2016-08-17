class GroupsController < ApplicationController
  def new
      @group = Group.new
    end

    def create
      @group=Group.create(group_params)
      if @group.save
        redirect_to dashboard_path, notice: "Group Successfully Added"
      else
        render :new
      end
    end

    def index
      @groups = Group.all
    end

    def show
      @group = Group.find_by id: params[:id]
    end

    def edit
      @group = Group.find_by id: params[:id]
    end

    def update
      @group = Group.find_by id: params[:id]
      if @group.update(group_params)
        redirect_to dashboard_path, notice: "Group Details Successfully Updated"
      else
        render :edit
      end
    end

    def delete
        @group = Group.find_by id: params[:id]
        @group.destroy
        redirect_to dashboard_path, notice: 'Group Details Removed'
    end

    private

    def group_params
      params.require(:group).permit()
    end

  end
