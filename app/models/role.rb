class Role < ActiveRecord::Base

  has_many :user_assignments, :class_name => "RoleAssignment"
  has_many :users, :through => :assignments

  validates :name, :presence => true
end
