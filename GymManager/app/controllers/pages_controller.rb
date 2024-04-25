# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def home
    @week = (Date.today.beginning_of_week..Date.today.end_of_week).to_a
  end

  def set_week
    selected_date = Date.parse(params[:week])
    @week = (selected_date.beginning_of_week..selected_date.end_of_week).to_a
    render :home
  end

  def refresh_plan
    redirect_to root_path
  end
end
