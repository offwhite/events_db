module Searches
  class Global < ::ControllerAction
    def call
      expose(search.events, '@events')
      expose(search.venues, '@venues')
      expose(search.tours, '@tours')
      expose(search.profiles, '@profiles')
      expose(query_str, '@query_str')
    end

    private

    def query_str
      @query_str ||= params.require('search').fetch('query')
    end

    def search
      @search ||= ::Search::Global.new(query_str)
    end
  end
end
