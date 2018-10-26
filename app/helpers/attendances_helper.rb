module AttendancesHelper
  
   # Returns a shortened date format for easier reading in list
  def date_reformat(date)
    
 word_date = '%a, %b %d'
 date.strftime(word_date)
 
  end  
end
