# frozen_string_literal: true

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

  mount_uploader :cover, PortfolioUploader

  # == Relationships ========================================================
  belongs_to :blog

  has_rich_text :content

  has_many :comments

  # == Validations ==========================================================

  validates :blog_id, :title, :summary, :cover, :slug, :meta_title,
            :meta_description, presence: true

  # == Scopes ===============================================================

  scope :blog, ->(name) { where(blog: name) }

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  # def blog
  #   Blog.find(blog_id)
  # end
end
