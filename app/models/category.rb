class Category < ActiveRecord::Base
  include Sluggable

  has_many :complaints

  sluggable_column :name
end