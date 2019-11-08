class Location < ApplicationRecord
  belongs_to :region
  has_many :people

  def self.billable
    joins(people: :role).where(roles: { billable: true }).distinct
  end

  def self.by_region_and_location_name
    joins(:region).merge(Region.order(:name)).order(:name)
  end
end
