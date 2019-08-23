class Event < ApplicationRecord
	has_one_attached :avatar
	has_many :attendances
	has_many :attendees, through: :attendances, class_name: "User"
	belongs_to :administrator, class_name: "User"

	def is_multiple_of_5?
		if self.duration%5 != 0 && self.duration != nil
			errors.add(:duration, "Entrez une valeur qui soit un multiple de 5 svp")
		end
	end

	def is_between_1_and_1000?
		if self.price < 1 || self.price > 1000
			errors.add(:duration, "Le prix doit se situer entre 1 et 1.000€")
		end
	end
	
	validates :start_date,
		presence: true, 
		inclusion: {in: (Date.today..Date.today + 50.years)}

	validates :duration,
		presence: true, 
		if: :is_multiple_of_5?
	
	validates :title,
		presence: true,
		length: { minimum: 5, maximum: 140 }
	
	validates :description,
		presence: true,
		length: { minimum: 20, maximum: 1000 }
	
	validates :price,
		presence: true,
		if: :is_between_1_and_1000?
	
	validates :location,
		presence: true 

end
