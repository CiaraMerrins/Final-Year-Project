class Player < ActiveRecord::Base
	belongs_to :coach
	has_many :posts do
		def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end

    def this_week
      where(:created_at => (Time.zone.now.beginning_of_week..Time.zone.now))
    end
  end    

	has_secure_password
	#acts_as_voter
	has_many :pins do
	def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end

    def this_week
      where(:created_at => (Time.zone.now.beginning_of_week..Time.zone.now))
    end
  end    

	
	mount_uploader :image, ImageUploader
	
	belongs_to :sport1, :class_name => :sport, :foreign_key => :sport1_id
	belongs_to :sport2, :class_name => :sport, :foreign_key => :sport2_id
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/}
validates_presence_of :coach_id
	def self.calculateBMI(player)
		player.bmi = (player.weight / (player.height * player.height) * 703)
		player.save
		#if statements to display what range you are in. 
		
	end
end
