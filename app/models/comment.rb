class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :complaint
  belongs_to :admin

  validates :body, presence: true
end