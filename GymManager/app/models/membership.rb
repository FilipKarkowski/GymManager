class Membership < ApplicationRecord
  belongs_to :user

  validate :start_date_cannot_be_in_the_past


  private

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "Data początkowa nie może być z przeszłości") if start_date.present? && start_date < Date.today
  end


end
