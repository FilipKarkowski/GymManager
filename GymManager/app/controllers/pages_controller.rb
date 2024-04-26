# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def home
    @week_start = Date.today.beginning_of_week
    @week_end = Date.today.end_of_week
    @days = (@week_start..@week_end).to_a
    @trainings_by_day = {}
    @days.each do |day|
      @trainings_by_day[day] = Schedule.where("date = ?", day).order(:time)
    end
  end
end
