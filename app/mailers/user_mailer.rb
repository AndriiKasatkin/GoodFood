class UserMailer < ApplicationMailer
	def contact_form(name, email, message)
	    @name = name
	    @email = email
	    @message = message
	    mail(to: "good.food.uzhnu@gmail.com", subject: "Message from site.")
  	end
end
