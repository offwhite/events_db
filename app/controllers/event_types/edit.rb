module EventTypes
  class Edit < ::AdminControllerAction
    def call
      expose(event_type, '@event_type')
      expose(existing_event_types, '@existing_event_types')
    end

    private

    def event_type
      @event_type ||= EventType.find params[:id]
    end

    def existing_event_types
      @existing_event_types ||= EventType.order(:name)
    end
  end
end
