##
# @file app/models/project.rb
#
# @model Project
#
# @description Model for Projects Table
#
class Project < ApplicationRecord
  # == Extensions ===========================================================

  # == Constants ============================================================

  TECH_OPTIONS = [
    'Ruby on Rails', 'JavaScript', 'HTML5', 'CSS3', 'SASS',
    'NodeJS', 'ReactJS', 'jQuery', 'Bootstrap', 'Heroku'
  ].freeze

  # == Attributes ===========================================================
  # t.string   :title
  # t.string   :slug
  # t.string   :cover
  # t.string   :images, array: true, default: []
  # t.string   :desktop
  # t.string   :mobile, array: true, default: []
  # t.string   :meta_title
  # t.string   :meta_description
  # t.text     :summary
  # t.string   :site_link
  # t.string   :repo_link
  # t.text     :description, array: true, default: []
  # t.string   :features, array: true, default: []
  # t.string   :apis, array: true, default: []
  # t.string   :tech_stack, array: true, default: []

  mount_uploader :cover, ImageUploader

  mount_uploaders :images, ImageUploader

  mount_uploader :desktop, ImageUploader

  mount_uploaders :mobile, ImageUploader

  # == Relationships ========================================================

  has_rich_text :content

  # == Validations ==========================================================

  validates :title, :cover, :images, :desktop, :mobile, presence: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  def self.attributes
    attribute_names.map(&:to_sym)
  end

  def pretty_print
    JSON.pretty_generate(attributes)
  end

  # == Instance Methods =====================================================
end
