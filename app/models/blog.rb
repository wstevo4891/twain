class Blog < ApplicationRecord
  has_many :articles

  mount_uploader :cover, ImageUploader
end
