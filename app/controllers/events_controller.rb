class EventsController < ApplicationController
  before_action do
    if @current_user.nil?
      redirect_to sign_in_path, alert: "Please Sign In"
    end
  end

  def new
      @event = Event.new
    end

    def create
      @event=Event.create(event_params)
      if @event.save
        redirect_to dashboard_path, notice: "Event Successfully Added"
      else
        render :new
      end
    end

    def index
      @events = Event.all
    end

    def show
      @event = Event.find_by id: params[:id]
    end

    def edit
      @event = Event.find_by id: params[:id]
    end

    def update
      @event = Event.find_by id: params[:id]
      if @event.update(event_params)
        redirect_to dashboard_path, notice: "Event Details Successfully Updated"
      else
        render :edit
      end
    end

    def delete
        @event = Event.find_by id: params[:id]
        @event.destroy
        redirect_to dashboard_path, notice: 'Event Details Removed'
    end

    private

    def event_params
      params.require(:event).permit()
    end

  end
