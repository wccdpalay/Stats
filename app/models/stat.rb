class Stat < ActiveRecord::Base
  belongs_to :user
  
  #Stat constants
  MAX_SCANNERS = 2
  MAX_VIDEO = 8
  MAX_MAC = 30
  MAX_SA_SHORT = 30
  MAX_SA_LONG = 50
  MAX_GU = 70
  MAX_LL = 10
  MAX_REF = 38
  
  
  validate do |check|
    check.vscanners
    check.vvideo
    check.vmacs
    check.vsa_short
    check.vsa_long
    check.vgu
    check.vll
    check.vref
  end
  
  validates_uniqueness_of :time, :scope => :date
  
 
  
  def vscanners
    errors.add_to_base("Not that many Scanners!") unless scanners <= MAX_SCANNERS
    errors.add_to_base("Can't be negative!") unless scanners >= 0
  end
  
  def vvideo
    errors.add_to_base("Not that many Video Editing Stations") unless video <= MAX_VIDEO
    errors.add_to_base("Can't be negative!") unless video >= 0
  end
  
  def vmacs
    errors.add_to_base("Not that many Macs!") unless macs <= MAX_MAC
    errors.add_to_base("Can't be negative!") unless macs >= 0
  end
  
  def vsa_short
    errors.add_to_base("Not that many PCs in Spec. Apps Short!") unless sa_short <= MAX_SA_SHORT
    errors.add_to_base("Can't be negative!") unless sa_short >= 0
  end
  
  def vsa_long
    errors.add_to_base("Not that many PCs in Spec. Apps Long!") unless sa_long <= MAX_SA_LONG
    errors.add_to_base("Can't be negative!") unless sa_long >= 0
  end
  
  def vgu
    errors.add_to_base("Not that many PCs in General Use!") unless gu <= MAX_GU
    errors.add_to_base("Can't be negative!") unless gu >= 0
  end
  
  def vll
    errors.add_to_base("Not that many PCs in Language Lab!") unless ll <= MAX_LL
    errors.add_to_base("Can't be negative!") unless ll >= 0
  end
  
  def vref
    errors.add_to_base("Not that many PCs in the Reference Area") unless ref <= MAX_REF
    errors.add_to_base("Can't be negative!") unless ref >= 0
  end
  
  
  def self.total_day(day = Date.today, col = "all")
    total = 0
    if col == "all"
      
    else
      
    end
    total
  end
end
