class Admin < ActiveRecord::Base
  include Sluggable

  has_many :complaints
  has_many :comments

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create, length: {minimum: 6}

  has_secure_password validations: false
  sluggable_column :nickname
end