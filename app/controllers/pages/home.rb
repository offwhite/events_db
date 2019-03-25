module Pages
  class Home < ::ControllerAction
    def call
      expose(recently_added_events, '@recently_added_events')
    end

    private

    def recently_added_events
      @recently_added_events ||= Event.order(id: :desc).limit(10)
    end
  end
end
