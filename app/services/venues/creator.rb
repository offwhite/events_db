module Venues
  # creates venues
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      return existing_venue if existing_venue.present?
      logger.call if venue.save
      venue
    end

    def venue
      @venue ||= Venue.new(full_params)
    end

    private

    attr_reader :params, :user

    def full_params
      @full_params ||= params.merge(
        verified: verified?
      )
    end

    def verified?
      @verified ||= user.admin?
    end

    def existing_venue
      @existing_venue ||=
        Venue.find_by(name: params[:name], town_id: params[:town_id])
    end

    def logger
      @logger ||= ::Utilities::Logger.new(venue, 'venue created', user)
    end
  end
end
