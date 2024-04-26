class Schedule < ApplicationRecord
  belongs_to :training

  validate :time_presence
  validate :time_not_overlap

  private

  def time_presence
    errors.add(:time, "musi być podana") unless time.present?
  end

  def time_not_overlap
    return unless time.present? && date.present?

    start_time = DateTime.new(date.year, date.month, date.day, time.hour, 0, 0)
    end_time = start_time + 1.hour

    if Schedule.where("date = ? AND (time BETWEEN ? AND ?)", date, start_time, end_time).exists?
      errors.add(:time, "nie może pokrywać się z innymi harmonogramami")
    end
  end
end
