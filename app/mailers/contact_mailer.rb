class ContactMailer < ApplicationMailer
	def send_mail(contact)
		@contact = contact
		mail(bcc: User.pluck(:email), subject: contact.subject)
	end
end
