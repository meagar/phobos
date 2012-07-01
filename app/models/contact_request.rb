
class ContactRequest
  extend ActiveModel::Naming
  include ActiveModel::Validations

  attr_accessor :email, :feedback

  validates :email, :format => { :with => /\A.*@.*\..*\z/, :message => "must be valid" }
  validates :feedback, :presence => true


  def to_key; []; end

  def initialize(params = {})
    self.email = params[:email]
    self.feedback = params[:feedback]
  end

end

