class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.save

			# Variables to be passed into the mailer
			name = params[:contact][:name]
			email = params[:contact][:email]
			phone = params[:contact][:phone]
			body = params[:contact][:comments]

			# Look into ContactMailer file/class and run the method contact_email passing the variables
			# above into the paramter and then use the deliver method inherited from ActionMailer class
			ContactMailer.contact_email(name, email, phone, body).deliver

			flash[:success] = "Message sent."
			redirect_to new_contact_path
		else
			flash[:danger] = "Error occured, message has not been sent"
			redirect_to new_contact_path
		end
	end



	private

	def contact_params
		params.require(:contact).permit(:name, :email, :phone, :comments)
	end
end
