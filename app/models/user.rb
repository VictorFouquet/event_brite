class User < ApplicationRecord
	has_many :events, through: :attendances, foreign_key: "attendee", class_name: "Attendance"
	has_many :attendances, foreign_key: "attendee", class_name: "Attendance"
	has_many :events, foreign_key: "administrator", class_name: "Event"
	validates :email,
		presence: true,
		uniqueness: true
	validates :encrypted_password,
		presence: true 
end
