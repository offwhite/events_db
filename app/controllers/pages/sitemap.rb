module Pages
  class Sitemap < ::ControllerAction
    def call
      expose(host, '@host')
      expose(profiles, '@profiles')
      expose(events, '@events')
      expose(venues, '@venues')
    end

    private

    def profiles
      @profiles ||= Profile.all
    end

    def events
      @events ||= Event.all
    end

    def venues
      @venues ||= Venue.all
    end

    def host
      @host ||= "#{request.protocol}#{request.host}"
    end
  end
end
