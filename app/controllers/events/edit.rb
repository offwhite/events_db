module Events
  class Edit < ::ControllerAction
    def call
      expose(event, '@event')
    end

    private

    def event
      @event ||= Event.find params[:id]
    end
  end
end
