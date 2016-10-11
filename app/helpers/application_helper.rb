require 'open-uri'
require 'json'
require 'ostruct'

module ApplicationHelper

  def fetch_meetups
      json = open("https://api.meetup.com/2/events?&sign=true&photo-host=public&venue_id=23753432&page=20&key=326e493f58383976434f5963243a5e&callback=?").read
      JSON.parse(json, object_class: OpenStruct)["results"]
  end

  def all_meetups
    @all_meetups ||= fetch_meetups
  end

  def meetups_this_week
    all_meetups.select {|t| t["time"] >= Time.now.beginning_of_week(start_day = :sunday).to_i*1000 && Time.now.end_of_week(end_day = :saturday).to_i*1000 >= t["time"] }
  end

  def fetch_meetups_worth_going
    json = open("https://api.meetup.com/2/events?member_id=214723522&offset=0&format=json&limited_events=False&photo-host=public&page=20&fields=&order=time&desc=false&status=upcoming&sig_id=214723522&sig=3a4b85b6198bbf0bf91af0e982e487fce878a93f
").read
    JSON.parse(json, object_class: OpenStruct)["results"]
  end

  def all_meetups_worth_going
    @meetups_worth ||= fetch_meetups_worth_going
  end

  def meetups_worth_this_week
    all_meetups_worth_going.select {|t| t["time"] >= Time.now.beginning_of_week(start_day = :sunday).to_i*1000 && Time.now.end_of_week(end_day = :sunday).to_i*1000 >= t["time"] }
  end

end
