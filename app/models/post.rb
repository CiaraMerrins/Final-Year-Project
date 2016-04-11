class Post < ActiveRecord::Base
has_many :comments, dependent: :destroy
belongs_to :player

validates :title, presence: true, length: {minimum:5}
validates :body, presence: true
end

