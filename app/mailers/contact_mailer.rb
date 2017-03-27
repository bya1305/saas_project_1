class ContactMailer < ActionMailer::Base
  default to: 'josh.avina78@gmail.com'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, subject: 'New Message from your Website!')
  end
end
