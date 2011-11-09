class HomeController < ApplicationController
  before_filter :paranoid_authentication
  before_filter :authenticate_user!
  layout = false

  def index
    render :text => "Yay! It Works!"
  end
end
