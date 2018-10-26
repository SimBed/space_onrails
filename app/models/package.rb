class Package < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  #Ordering the packages with default_scope
  default_scope -> { order(purchased_on: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
#  validates :instructor, presence: true, length: { maximum: 30 }
   validates :purchased_on, presence: true
   validates :classes, inclusion: { in: 1..1100 }
end
