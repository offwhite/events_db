module Venues
  class Geocoder
    def initialize(venue, user = nil)
      @venue = venue
      @user = user
    end

    def call
      return unless valid?
      return unless success
      update_venue
      logger.call
    end

    private

    attr_reader :venue, :user

    def update_venue
      venue.update(
        address: result['formatted_address'],
        latitude: result['geometry']['location']['lat'],
        longitude: result['geometry']['location']['lng']
      )
    end

    def valid?
      @valid ||= venue.address.present? && !Rails.env.test?
    end

    def result
      @result ||= json['results']&.first
    end

    def json
      @json ||= JSON.parse(response.body)
    end

    def success
      @success ||= response&.code == 200 && json.present? && result.present?
    end

    def response
      @response ||= RestClient.get(url)
    end

    def url
      "#{base_url}#{address}&key=#{api_key}"
    end

    def address
      @address ||=
        "#{venue.name},#{venue.address},#{venue.town_title}".parameterize
    end

    def base_url
      @base_url ||= 'https://maps.googleapis.com/maps/api/geocode/json?address='
    end

    def api_key
      ENV.fetch('GOOGLE_API_KEY')
    end

    def logger
      @logger ||= ::Utilities::Logger.new(venue, 'venue geocoded', user)
    end
  end
end
