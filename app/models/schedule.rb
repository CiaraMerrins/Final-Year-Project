class Schedule < ActiveRecord::Base
  belongs_to :section
  belongs_to :coach
  mount_uploader :image, ImageUploader
end
