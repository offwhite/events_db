module Venues
  # creates venues
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      return if town.nil?
      return existing_venue if existing_venue.present?
      logger.call if venue.save
      geocoder.call
      venue
    end

    def venue
      @venue ||= Venue.new(full_params)
    end

    private

    attr_reader :params, :user

    def full_params
      @full_params ||= params.merge(
        verified: verified?,
        slug: venue_slug
      )
    end

    def verified?
      @verified ||= user.admin?
    end

    def existing_venue
      @existing_venue ||=
        Venue.find_by(name: params[:name], town_id: params[:town_id])
    end

    def venue_slug
      @venue_slug ||= town.name.parameterize + '-' + params[:name].parameterize
    end

    def geocoder
      @geocoder ||= ::Venues::Geocoder.new(venue, user)
    end

    def logger
      @logger ||= ::Utilities::Logger.new(venue, 'venue created', user)
    end

    def town
      @town ||= Town.find_by_id params[:town_id]
    end
  end
end
