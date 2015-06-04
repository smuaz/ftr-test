module ComplaintsHelper
  def has_favourite?(complaint)
    fav = Favourite.find_by user_id: current_user.id, complaint_id: complaint.id
    true if fav.nil? || !fav.favourite
  end
end