class Pin < ActiveRecord::Base
acts_as_votable
belongs_to :player
has_attached_file:image, styles: { medium: "300*300>" }
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
validates_presence_of :image_file_name
#validates :textfield, :presence => true
 validate :player_quota, :on => :create  
def score
  self.get_upvotes.size - self.get_downvotes.size
  end
  
   

private 
  def player_quota
   if player.pins.today.count >= 2
     errors.add(:base, "Each Player is only allowed post 2 photos a day - Sorry")
   elsif player.pins.this_week.count >= 5
     errors.add(:base, "Exceeds weekly limit")
   end
  end
end
