class FavouritesController < ApplicationController
  before_action :require_user
  before_action :set_complaint

  def create
    @favourite = Favourite.create(user: current_user, complaint: @complaint, favourite: params[:favourite])

    respond_to do |format|
      format.html 
      format.js
    end
  end

  def destroy
    Favourite.delete(@complaint.favourites.first.id)

    respond_to do |format|
      format.html 
      format.js
    end
  end
  
  private

  def set_complaint
    @complaint = Complaint.find_by slug: params[:complaint_id]
  end
end