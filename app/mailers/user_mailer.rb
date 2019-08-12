class UserMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'

	def welcome_email(user)
		@user = user
		@url = 'https://eventbritefouquet.herokuapp.com'
		mail(to: @user.email, subject: 'Bienvenue chez nous !')
	end
	
end
