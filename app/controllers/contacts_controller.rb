class ContactsController < ApplicationController
	before_action :authenticate_user!
def new
	@contact = Contact.new
end
def create
   @contact = Contact.new(contact_params)
   @contact.save
   ContactMailer.send_mail(@contact).deliver_now
   redirect_to contacts_path
 end
def index
	@contacts = Contact.all
end

  private
  def contact_params
    params.require(:contact).permit(:subject, :message)
  end
end
