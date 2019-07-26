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

  mount_uploader :cover, ImageUploader

  mount_uploaders :images, ImageUploader

  mount_uploader :desktop, ImageUploader

  mount_uploaders :mobile, ImageUploader

  # == Relationships ========================================================

  has_rich_text :content

  # == Validations ==========================================================

  # validates :title, :cover, :summary, presence: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  def self.attributes
    attribute_names.map(&:to_sym)
  end

  # == Instance Methods =====================================================
end
