# app/controllers/api/dashboard_controller.rb

# frozen_string_literal: true

module Api
  # Controller for API Dashboard
  class DashboardController < ApplicationController
    def index
      @dashboard = Dashboard.new
    end
  end
end
