class Player < ActiveRecord::Base
	belongs_to :coach
	has_many :posts
	has_secure_password
	has_many :pins

	belongs_to :sport1, :class_name => :sport, :foreign_key => :sport1_id
	belongs_to :sport2, :class_name => :sport, :foreign_key => :sport2_id
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/}
	
	def self.calculateBMI(player)
		player.bmi = (player.weight / (player.height * player.height) * 703)
		player.save
		#if statements to display what range you are in. 
	end
end
