class ContactRequest < ActiveRecord::Base
  attr_accessible :body, :email, :name

  validates :name, :presence => true, :length => { :maximum => 255 }
  validates :email, :format => { :with => /\A.*@.*\..*\z/, :message => "must contain a valid email address" }
  validates :body, :presence => true
end
