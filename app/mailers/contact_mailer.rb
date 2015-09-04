class ContactMailer < ActionMailer::Base
	default to: 'hey@iambradley.me'

	def contact_email(name, email, phone, body)
		@name = name
		@email = email
		@phone = phone
		@body = body

		mail(from: email, subject: 'contact form message')
	end


end
