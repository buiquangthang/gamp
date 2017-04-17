class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_global_api
    GoogleMapsService.configure do |config|
      config.key = 'AIzaSyDBEPeNCZHAyqAYysF2-ykAp8jfd47bxIw'
      config.retry_timeout = 20
      config.queries_per_second = 10
    end

    @gmaps = GoogleMapsService::Client.new
  end
end
