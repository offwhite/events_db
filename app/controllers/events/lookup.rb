module Events
  class Lookup < ::ControllerAction
    def call
      expose(events, '@events')
    end

    private

    def events
      @events ||=
        Event.where(venue_id: venue_id, date: date)
    end

    def venue_id
      @venue_id ||= params[:venue_id]
    end

    def date
      @date ||= params[:date]
    end
  end
end
