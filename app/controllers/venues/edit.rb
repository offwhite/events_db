module Venues
  class Edit < ::AdminControllerAction
    def call
      expose(venue, '@venue')
    end

    private

    def venue
      @venue ||= Venue.find params[:id]
    end
  end
end
