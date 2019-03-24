module Venues
  class Lookup < ::ControllerAction
    def call
      expose(venues, '@venues')
      expose(query_str, '@query_str')
    end

    private

    def venues
      @venues ||=
        Venue.fuzzy_search(query_str)
             .limit(20)
    end

    def query_str
      @query_str ||= params[:search]
    end
  end
end
