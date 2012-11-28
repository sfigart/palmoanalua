class HomeController < ApplicationController
  
  caches_page :volleyball
  
  def index
    @users = User.all
  end
end
