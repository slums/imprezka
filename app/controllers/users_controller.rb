class UsersController < ApplicationController

  def index
    @users = User.all :conditions => { :commercial => false, :is_active => true }
  end

  def list
    @users = User.all :conditions => { :commercial => false, :is_active => true }
  end

  def list_clubs
    @users = User.all :conditions => { :commercial => true, :is_active => true }
  end

end
