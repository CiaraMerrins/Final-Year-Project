class Sport < ActiveRecord::Base
	has_many :players
	has_many :coaches
end
