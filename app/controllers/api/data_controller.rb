# app\controllers\api\data_controller.rb

module Api
  # Controller for rendering prettified JSON of API records
  class DataController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:show]

    def index
      render plain: JSON.pretty_generate(record_index)
    end

    def show
      render plain: JSON.pretty_generate(show_record)
    end

    private

    def record_index
      params[:model].constantize.all.map(&:attributes)
    end

    def show_record
      params[:model].constantize.find_by(slug: params[:slug]).attributes
    end
  end
end
