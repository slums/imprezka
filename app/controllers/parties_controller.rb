class PartiesController < ApplicationController

  def index
    friendlist = client.selection.me.friends.info!['data'].map(&:id)
    @parties = Party.all
    @parties.reject! { |singleparty| (singleparty.user.id != current_user.id) && (singleparty.for_who != "all") && (!friendlist.include?(singleparty.user.uid)) }
    @parties.reject! { |singleparty| singleparty.user.is_active == false  }
  end

  def list
    @parties = Party.all
  end

  def show
    friendlist = client.selection.me.friends.info!['data'].map(&:id)
    singleparty = Party.find(params[:id])
    if (singleparty.user.is_active)
      if ( (singleparty.user.id == current_user.id) || (singleparty.for_who == "all") || (friendlist.include?(singleparty.user.uid)) )
        @party = singleparty
      end
    end
  end

  def new
    @party = Party.new
  end

  def edit
    singleparty = Party.find(params[:id])
    if (singleparty.user.id == current_user.id)
      @party = singleparty
    end
  end

  def create
    @party = Party.new(params[:party])
    @party.user_id = current_user.id
    @party.commercial = current_user.commercial
    if @party.save
      redirect_to @party
    else
      render :action => "new"
    end
  end

  def update
    @party = Party.find(params[:id])
    if (@party.user.id == current_user.id)
      if @party.update_attributes(params[:party])
        redirect_to @party
      else
        render :action => "edit"
      end
    end
  end


  def destroy
    if (Party.all.map(&:id).include?(params[:id].to_i))
      @party = Party.find(params[:id])
      if (@party.user.id == current_user.id)
        @party.destroy
      end
    end
    redirect_to(parties_url)
  end

end
