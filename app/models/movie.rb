# app\models\movie.rb

# Movie Table class
class Movie < ApplicationRecord
  # == Extensions ===========================================================
  include PgSearch::Model

  # == Attributes =============================================================
  # t.string   :title
  # t.string   :slug
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
  # t.string   :genres_list

  # attr_reader :genres_list

  mount_uploader :photo, BoltNetworkUploader

  mount_uploader :banner, BoltNetworkUploader

  mount_uploader :logo, BoltNetworkUploader

  # == Relationships ==========================================================
  has_and_belongs_to_many :genres

  # == Validations ============================================================
  validates :title, :year, :rated, :run_time, :plot, presence: true

  # == Callbacks ==============================================================
  # after_initialize do
  #   @genres_list = three_genres
  # end

  # == Scopes =================================================================
  pg_search_scope :search_by_title, against: :title, using: [:tsearch]

  scope :recent, -> { where('year > ?', Date.today.year - 5) }

  # == Class Methods ==========================================================
  def self.find_by_genre(genre_id)
    Genre.find(genre_id).movies
  end

  def self.by_first_char(query)
    where('lower(title) LIKE :prefix', prefix: "#{query}%")
  rescue ActiveRecord::RecordNotFound
    []
  end

  def self.lower_case_match(query)
    where(arel_table[:title].lower.matches("%#{query}%"))
  end

  def self.title_match(query, limit)
    Movie.lower_case_match(query).limit(limit)
  rescue ActiveRecord::RecordNotFound
    []
  end

  # == Instance Methods =======================================================
  # def three_genres
  #   genres.limit(3).pluck(:title)
  # end
end
