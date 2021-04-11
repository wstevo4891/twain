# app\models\genre.rb

# Genre Table class
class Genre < ApplicationRecord
  # == Extensions ===========================================================
  include PgSearch::Model

  # == Attributes =============================================================
  # title    [String]
  # slug     [String]
  # plural   [String]
  # category [String]

  # == Relationships ==========================================================
  has_and_belongs_to_many :movies
  has_many :subgenres

  # == Validations ============================================================
  validates :title, :slug, :plural, :category, presence: true

  # == Scopes =================================================================
  pg_search_scope :full_text_search,
                  against: %i[title plural category],
                  using: [:tsearch]

  # == Class Methods ==========================================================
  def self.by_first_char(query)
    where('lower(title) LIKE :prefix', prefix: "#{query}%")
  rescue ActiveRecord::RecordNotFound
    []
  end

  def self.lower_case_match(query)
    where(arel_table[:title].lower.matches("%#{query}%"))
  end

  def self.name_match(query)
    genres = lower_case_match(query)

    return genres unless genres.empty?

    full_text_search(query)
  rescue ActiveRecord::RecordNotFound
    []
  end

  # Single query to find genres with the most movies
  def self.with_most_movies
    joins(:genres_movies)
      .group('genres.id')
      .having('count(genre_id) > ?', 28)
      .pluck(:title)
  end

  # == Instance Methods =======================================================
end


# Blog.includes(posts: [:comments])
#     .where(posts: { id: params[:post_id]})
#     .find(params[:blog_id])

# Tag.limit(100).select { |tag| tag.posts.size > 5000 }

# Tag.limit(100)
#    .joins(:posts_tags)
#    .group('tags.id')
#    .having('count(tag_id > ?', 5000)
