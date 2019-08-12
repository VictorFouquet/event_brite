class User < ApplicationRecord
	after_create :welcome_send

	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	end
	
	has_many :events, through: :attendances, foreign_key: "attendee", class_name: "Attendance"
	has_many :attendances, foreign_key: "attendee", class_name: "Attendance"
	has_many :events, foreign_key: "administrator", class_name: "Event"
	validates :email,
		presence: true,
		uniqueness: true
	validates :encrypted_password,
		presence: true 
end
