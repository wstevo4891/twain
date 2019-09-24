# app\models\movie.rb

class Movie < ApplicationRecord
  # == Attributes =============================================================
  # t.string   :title
  # t.integer  :year
  # t.string   :rated
  # t.string   :release_date
  # t.string   :run_time
  # t.string   :directors, array: true, default: []
  # t.string   :writers, array: true, default: []
  # t.string   :actors, array: true, default: []
  # t.string   :plot
  # t.string   :photo
  # t.string   :logo
  # t.string   :poster
  # t.json     :ratings

  attr_reader :genres_list

  mount_uploader :photo, ImageUploader

  # == Relationships ==========================================================
  has_and_belongs_to_many :genres

  # == Validations ============================================================
  validates :title, :year, :rated, :run_time, :plot, presence: true

  # == Callbacks ==============================================================
  after_initialize do
    @genres_list = three_genres
  end

  # == Scopes =================================================================

  # == Class Methods ==========================================================
  def self.find_by_genre(genre_id)
    Genre.find(genre_id).movies
  end

  def self.by_first_char(query)
    where('lower(title) LIKE :prefix', prefix: "#{query}%")
  end

  def self.lower_case_match(query)
    where(arel_table[:title].lower.matches("%#{query}%"))
  end

  # == Instance Methods =======================================================
  def three_genres
    genres.limit(3).pluck(:name)
  end
end