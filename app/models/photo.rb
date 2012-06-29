class Photo < ActiveRecord::Base
  belongs_to :photo_set
  belongs_to :created_by, :class_name => "User"

  mount_uploader :image, ImageUploader

  validates :image, :presence => true
end
