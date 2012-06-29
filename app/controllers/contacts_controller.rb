
class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      redirect_to :index, :notice => "Contact created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update_attributes(params[:contact])
      redirect_to :index, :notice => "Contact updated"
    else
      render :edit
    end
  end

  protected

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def post_params
    params[:contact].slice(:title, :name, :email, :phone_home, :phone_mobile)
  end

end

