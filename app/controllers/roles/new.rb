module Roles
  class New < ::EditControllerAction
    def call
      expose(role, '@role')
      expose(event, '@event')
    end

    private

    def role
      @roles ||= Role.new(event: event)
    end

    def event
      @event ||= Event.find params[:event_id]
    end
  end
end
