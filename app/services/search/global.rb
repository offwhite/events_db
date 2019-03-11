module Search
  class Global
    def initialize(query_str)
      @query_str = query_str
    end

    def call
      @call ||= events
    end

    private

    attr_reader :query_str

    def events
      @events ||= Event.fuzzy_matches(query_str)
    end
  end
end
