class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def list
  end

  def new
  end

end
