class Contact < ActiveRecord::Base

  validates :title, :presence => true, :length => { :within => 1..255 }
  validates :name, :presence => true, :length => { :within => 1..255 }
  validates :email, :format => /\A.+@.+\..+\Z/
  validates :phone_mobile, :numericality => true
  validates :phone_home, :numericality => true

  attr_accessible :name, :title, :email, :phone_mobile, :phone_home
end
