class HomeController < ApplicationController
  
  caches_page :volleyball, :privacy
  
  def index
    @users = User.all
  end
end
