# app\models\sub_genre.rb

class SubGenre < ApplicationRecord
  belongs_to :genre

  validates :title, presence: true
end
