class HomeController < ApplicationController
  before_filter :paranoid_authentication
  before_filter :authenticate_user!

  def index
    render :layout => false
  end
end
