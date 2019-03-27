module Pages
  class Home < ::ControllerAction
    def call
      expose(recent_events, '@recent_events')
    end

    private

    def recent_events
      @recent_events ||= Event.recent
    end
  end
end
