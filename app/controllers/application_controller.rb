class ApplicationController < ActionController::Base
  
  def home
    render html: "Space homepage"
end
