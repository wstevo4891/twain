# app\models\genre.rb

class Genre < ApplicationRecord
  # == Attributes =============================================================
  # title [String]
  # plural [String]
  # category [String]

  # == Relationships ==========================================================
  has_and_belongs_to_many :movies
  has_many :subgenres

  # == Validations ============================================================
  validates :title, :plural, :category, presence: true

  # == Scopes =================================================================

  # == Class Methods ==========================================================
  def self.by_first_char(query)
    where('lower(title) LIKE :prefix', prefix: "#{query}%")
  end

  def self.lower_case_match(query)
    where(arel_table[:title].lower.matches("%#{query}%"))
  end

  # == Instance Methods =======================================================
end
