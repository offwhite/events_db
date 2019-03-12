module Venues
  class Edit < ::EditControllerAction
    def call
      expose(venue, '@venue')
    end

    private

    def venue
      @venue ||= Venue.find params[:id]
    end
  end
end
