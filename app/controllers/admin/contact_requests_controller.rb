
class Admin::ContactRequestsController < Admin::BaseController

  before_filter :find_contact_request, :only => %w(show update)

  def index
    @contact_requests = ContactRequest.order(:created_at).all
  end

  def show
  end

  def update

  end

  def find_contact_request
    @contact_requests = ContactRequest.find(params[:id])
  end

end
