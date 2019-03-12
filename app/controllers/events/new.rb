module Events
  class New < ::EditControllerAction
    def call
      expose(event, '@event')
      expose(tour, '@tour')
    end

    private

    def event
      @event ||= Event.new(
        tour_id: tour&.id,
        name: tour&.name,
        event_type: tour&.tour_type
      )
    end

    def tour
      return if params[:tour_id].nil?
      @tour ||= Tour.find(params[:tour_id])
    end
  end
end
