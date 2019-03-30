module Admin
  class VenuesMap < ::AdminControllerAction
    def call
      expose(venues, '@venues')
    end

    private

    def venues
      @venues ||= Venue.all
    end
  end
end
