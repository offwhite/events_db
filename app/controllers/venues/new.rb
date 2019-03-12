module Venues
  class New < ::EditControllerAction
    def call
      expose(venue, '@venue')
      expose(town, '@town')
    end

    private

    def town
      return if params[:town_id].nil?
      @town ||= Town.find(params[:town_id])
    end

    def venue
      @venue ||= Venue.new(
        town: town
      )
    end
  end
end
