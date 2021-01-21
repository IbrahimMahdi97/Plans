class UsersController < ApplicationController
  def index
    @users = Users.all
  end
  
  def show
    @user = Users.find(params[:id])
  end
end
