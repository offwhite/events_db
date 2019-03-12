module Admin
  class Index < ::AdminControllerAction
    def call
      expose(events, '@events')
    end

    private

    def events
      @events ||= Event.order(id: :desc)
    end
  end
end
