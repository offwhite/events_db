module Admin
  class Index < ::AdminControllerAction
    def call
      expose(events, '@events')
      expose(venues, '@venues')
      expose(profiles, '@profiles')
      expose(tours, '@tours')
      expose(roles, '@roles')
    end

    private

    def events
      @events ||= Event.order(:created_at)
    end

    def venues
      @venues ||= Venue.order(:created_at)
    end

    def profiles
      @profiles ||= Profile.order(:created_at)
    end

    def tours
      @tours ||= Tour.order(:created_at)
    end

    def roles
      @roles ||= Role.order(:created_at)
    end
  end
end
