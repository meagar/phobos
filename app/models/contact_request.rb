class ContactRequest < ActiveRecord::Base
  attr_accessible :body, :email, :name

  validates :name, :presence => true, :length => { :maximum => 255 }
  validates :email, :format => { :with => /\A.*@.*\..*\z/ }
  validates :body, :presence => true
end
