class PagesController < ApplicationController

  def home
  end

  def calendar
  end

  def contact
    @contact = ContactRequest.new
  end

  def submit_contact
    @contact = ContactRequest.new(params[:contact_request])

    if @contact.valid?
      flash[:contact_sent] = true
      redirect_to :contact
    else
      render :contact
    end
  end

  protected

  def active_nav
    @active_nav ||= action_name.titleize
  end

end
