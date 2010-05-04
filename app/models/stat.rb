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
    check.vmac
    check.vsa_short
    check.vsa_long
    check.vgu
    check.vll
    check.vref
  end
  
  def vscanners
    errors.add_to_base("Not that many Scanners!") unless scanners <= MAX_SCANNERS
  end
  
  def vvideo
    
  end
  
  def vmac
    
  end
  
  def vsa_short
    
  end
  
  def vsa_long
    
  end
  
  def vgu
    
  end
  
  def vll
    
  end
  
  def vref
    
  end
  
  
  def self.total_day(day = Date.today, col = "all")
    total = 0
    if col == "all"
      
    else
      
    end
    total
  end
end
