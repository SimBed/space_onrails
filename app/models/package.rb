class Package < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  #test code for experimenting with form input that does not need to be saved to database
  #attr_accessor :testperiod
  #before_save { self.expiry = expirycalc(purchased_on,validity_type,testperiod.to_i) }
  before_save { self.expiry = expirycalc(purchased_on,validity_type,validity_period) }
  #Ordering the packages with default_scope
  default_scope -> { order(purchased_on: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
#  validates :instructor, presence: true, length: { maximum: 30 }
   validates :purchased_on, presence: true
   validates :classes, inclusion: { in: 1..1100 }
   validates :validity_type, inclusion: { in: ["months","weeks"] }
   validates :validity_period, inclusion: { in: 1..52 }
   
 private

    def expirycalc(purchon,valtype,valperiod)
      
      valtype=="months" ? purchon + valperiod.month - 1.day : purchon + valperiod.week - 1.day
      
     #p_on + v_p.v_t.inspect
    end   

end
