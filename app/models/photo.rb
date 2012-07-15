class Photo < ActiveRecord::Base
  belongs_to :photo_set
  belongs_to :created_by, :class_name => "User"

  mount_uploader :image, ImageUploader

  attr_accessible :title, :image
  validates :image, :presence => true
end
