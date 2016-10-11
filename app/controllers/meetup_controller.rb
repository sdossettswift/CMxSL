class MeetupController < ApplicationController
  def new
  end

  def edit
  end

  def index
    results = JSON.parse(Http.get("https://api.meetup.com/2/events?key=545b6a4963693171453e1466e507e2e&group_urlname=Houstons-Startup-Demo-Day&sign=true"))

    render json: results

  end

  def show
  end
end
