module Roles
  class New < ::EditControllerAction
    def call
      expose(role, '@role')
      expose(event, '@event')
      expose(tour, '@tour')
      expose(title, '@title')
    end

    private

    def role
      @roles ||= Role.new(event: event, tour: tour)
    end

    def event
      return if params[:event_id].nil?
      @event ||= Event.find params[:event_id]
    end

    def tour
      return if params[:tour_id].nil?
      @tour ||= Tour.find params[:tour_id]
    end

    def title
      @title ||= event&.full_title || tour&.title
    end
  end
end
