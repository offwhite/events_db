module Search
  class Global
    def initialize(query_str, limit = 50)
      @query_str = query_str
      @limit = limit
    end

    def events
      @events ||= Event.fuzzy_matches(query_str).limit(limit)
    end

    def venues
      @venues ||= Venue.fuzzy_matches(query_str).limit(limit)
    end

    def profiles
      @profiles ||= Profile.matches(query_str).limit(limit)
    end

    private

    attr_reader :query_str, :limit

    # TODO: log the search - y'know for metrics
  end
end
