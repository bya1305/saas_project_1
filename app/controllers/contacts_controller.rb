class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)

    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comment]

      ContactMailer.contact_email(name, email, body).deliver
      
      flash[:success] = "Message Sent!"
      redirect_to new_contact_path
    else
      flash[:danger] = "An Error Occured, Message Not Sent =("
      redirect_to new_contact_path
    end
  end


  private

    def contact_params
      params.require(:contact).permit(:name, :email, :comment)
    end
end