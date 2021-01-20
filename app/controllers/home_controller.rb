class HomeController < ApplicationController
  before_action :authenticate_user!
  def index 
    @user = current_user
    @session = user_session
    render
  end
end
