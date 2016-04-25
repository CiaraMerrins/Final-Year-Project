class Post < ActiveRecord::Base
has_many :comments, dependent: :destroy
belongs_to :player
belongs_to :title

validates :body, presence: true

 validate :player_quota, :on => :create  

private 
  def player_quota
   if player.posts.today.count >= 3
     errors.add(:base, "Exceeds daily limit")
   elsif player.posts.this_week.count >= 5
     errors.add(:base, "Exceeds weekly limit")
   end
  end
def self.search(query)
where("posts.title LIKE?", "%#{query}%")
end
end

