module Searches
  class Global < ::ControllerAction
    def call
      expose(events, '@events')
      expose(query_str, '@query_str')
    end

    private

    def query_str
      @query_str ||= params.require('search').fetch('query')
    end

    def search
      @search ||= ::Search::Global.new(query_str)
    end

    def events
      @events ||= search.call
    end
  end
end
