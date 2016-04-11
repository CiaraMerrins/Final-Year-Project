class Coach < ActiveRecord::Base
	has_secure_password
	
	belongs_to :sport
	
	has_many :players, dependent: :destroy
	has_many :comments
end
