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

  # mount_uploader :cover, CoverUploader

  # == Relationships ========================================================

  has_rich_text :text

  # == Validations ==========================================================

  # validates :title, :cover, :summary, presence: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
