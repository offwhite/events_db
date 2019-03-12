module Venues
  # creates venues
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      return existing_venue if existing_venue.present?
      venue
    end

    def venue
      @venue ||= Venue.create(full_params)
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
  end
end
