module ApplicationHelper
  
  # Returns whether the page is the active page or not (and thus sets the class to active ready for some CSS styling).
  def active_page(a_p, dd)
    
    if (a_p.to_s.downcase == dd.to_s.downcase)
      "active"
    else
      ""
#      "#{a_p} does not equal #{dd}"
    end
  end  
  
  
end
