class ContactsController < ApplicationController
  	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash.now[:error] = nil
		else
			flash.now[:error] = 'Cannot send message.'
			render :new
		end
	end

	def sendmail
		@name = params[:user][:name]
		@email = params[:user][:email]
		@message = params[:user][:message]
		UserMailer.contact_form(@name, @email, @message).deliver_later
		flash.now[:success] = "Email was sended! Success!"
		redirect_to root_path
	end
end
