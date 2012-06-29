
class PhotoSet < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User"
  has_many :photos, :order => :position

  def thumbnail
    self.photos.first.try(:image)
  end

  validates :title, :presence => true, :length => { :maximum => 255 }
  validates :position, :presence => true

  before_validation :set_position, :on => :create

  attr_accessible :title, :description

  protected

  def set_position
    self.position ||= PhotoSet.order(:position).last.try(:position) || 1
  end

end

