class Membership < ApplicationRecord
  belongs_to :user

  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date

  private

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "Data poczatkowa nie moze byc z przeszlosci") if start_date.present? && start_date < Date.today
  end

  def end_date_cannot_be_before_start_date
    errors.add(:end_date, "Blad daty, zle podana data.") if end_date.present? && end_date < start_date
  end
end
