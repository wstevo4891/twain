##
# @file app/models/article.rb
#
# @model Article
#
# @description Model for Articles Table
#
class Article < ApplicationRecord
  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  mount_uploader :cover, ImageUploader

  # == Relationships ========================================================

  has_rich_text :content

  # == Validations ==========================================================

  # validates :title, :cover, :date, :description, presence: true

  # == Scopes ===============================================================

  scope :blog, ->(name) { where(blog: name) }

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  def self.attributes
    attribute_names.map(&:to_sym)
  end

  # == Instance Methods =====================================================
end
