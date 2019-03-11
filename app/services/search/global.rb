module Search
  class Global
    def initialize(query_str)
      @query_str = query_str
    end

    def events
      @events ||= Event.fuzzy_matches(query_str)
    end

    def venues
      @venues ||= Venue.fuzzy_matches(query_str)
    end

    private

    attr_reader :query_str

    # TODO: log the search - y'know for metrics
  end
end
