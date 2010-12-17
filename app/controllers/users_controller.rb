class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def list
  end

end
