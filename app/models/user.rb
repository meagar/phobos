class User < ActiveRecord::Base

  has_many :role_assignments, :class_name => "RoleAssignment"
  has_many :roles, :through => :role_assignments

  has_many :photo_sets, :foreign_key => :created_by_id
  has_many :photos, :foreign_key => :created_by_id

  has_secure_password

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :last_name, :presence => true
  validates :password, :presence => true

  def self.authenticate email, password
    find_by_email(email).try(:authenticate, password)
  end
end
