class User < ActiveRecord::Base

  has_many :role_assignments, :class_name => "RoleAssignment"
  has_many :roles, :through => :role_assignments

  has_many :photo_sets, :foreign_key => :created_by_id
  has_many :photos, :foreign_key => :created_by_id

  has_many :news_posts, :foreign_key => :created_by_id

  has_secure_password

  scope :newsletter_subscribers, where(:newsletter => true)

  attr_accessible :email, :display_name, :password, :password_confirmation, :newsletter

  validates :email, :presence => true, :uniqueness => true
  validates :display_name, :presence => true, :length => { :maximum => 255 }
  validates :password, :presence => true

  def self.authenticate email, password
    find_by_email(email).try(:authenticate, password)
  end

  def admin?
    true
  end
end
