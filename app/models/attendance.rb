class Attendance < ApplicationRecord
  belongs_to :package
  default_scope -> { order(:date) }
  validates :package_id, presence: true
  validates :date, presence: true
end
