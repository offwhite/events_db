module Admin
  class EventTypes < ::AdminControllerAction
    def call
      expose(event_types, '@event_types')
    end

    private

    def event_types
      @event_types ||= EventType.order(:name).page(params[:page])
    end
  end
end
