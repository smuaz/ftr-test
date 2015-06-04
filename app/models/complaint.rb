class Complaint < ActiveRecord::Base
  include Sluggable
  include Voteable

  has_many :comments
  has_many :favourites

  belongs_to :admin
  belongs_to :user
  belongs_to :category
  belongs_to :state
  belongs_to :status

  validates :title, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  
  sluggable_column :title

  def status(param)
    status = Status.find_by id: param.status_id
    status.name
  end
end