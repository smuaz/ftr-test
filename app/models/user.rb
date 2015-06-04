class User < ActiveRecord::Base
  include Sluggable

  has_many :complaints
  has_many :comments
  has_many :favourites
  has_many :votes

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 6}

  has_secure_password validations: false
  sluggable_column :nickname
end