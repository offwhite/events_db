module Events
  class Clone < ::EditControllerAction
    def call
      return if controller.performed?
      expose(event, '@event')
      expose(old_event, '@old_event')
    end

    private

    def event
      @event ||= old_event.dup
    end

    def old_event
      @old_event ||= Event.find params[:id]
    end
  end
end
