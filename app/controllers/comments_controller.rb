class CommentsController < ApplicationController

  def create
    @party = Party.find(params[:party_id])
    @comment = @party.comments.create(:body => params[:comment]["body"], :user_id => current_user.id)
    redirect_to @party
  end

end
