module Events
  class New < ::EditControllerAction
    def call
      expose(event, '@event')
    end

    private

    def event
      @event ||= Event.new
    end
  end
end
