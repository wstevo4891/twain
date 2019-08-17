# app\presenters\api\dashboard.rb

module Api
  # Presenter for APIs Dashboard
  class Dashboard
    attr_reader :routes

    def initialize
      @routes = routes_index
      set_options
    end

    private

    def routes_index
      Rails.application.routes.set.anchored_routes
           .map(&:defaults)
           .select { |h| h[:controller] =~ %r{api\/v1} }
    end

    def set_options
      @routes.each do |route|
        route[:model] = route_model(route)
        route[:options] = model_slugs(route) if route[:action] == 'show'
      end
    end

    def route_model(route)
      route[:controller].split('/').last.singularize.titleize
    end

    def model_slugs(route)
      route[:model].constantize.pluck(:slug)
    end
  end
end
