class Attendance < ApplicationRecord
  belongs_to :user

  # def self.attendance_data(year, month)
  #   where("strftime('%Y-%m', check_in) = ?", "#{year}-#{month}")
  # end
  


end
