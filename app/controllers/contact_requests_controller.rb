
class ContactRequestsController < ApplicationController

  def new
    @contact = ContactRequest.new(params[:contact_request])
  end

  def create
    @contact = ContactRequest.new(params[:contact_request])

    if @contact.save
      flash[:contact_sent] = true
      redirect_to new_contact_request_path
    else
      render :new
    end
  end

end

