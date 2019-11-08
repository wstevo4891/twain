class BillableLocationsController < ApplicationController
  def index
    @locations = Location.from(Location.billable, :locations)
                         .by_region_and_location_name
  end
end
