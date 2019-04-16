module Admin
  class Events < ::AdminControllerAction
    def call
      expose(events, '@events')
      expose(type, '@type')
    end

    private

    def events
      events_by_type || all_events
    end

    def all_events
      @all_events ||= Event.order(id: :desc).page(params[:page])
    end

    def events_by_type
      return if type.nil?
      @event_by_type ||=
        Event.where(event_type: type.id)
             .order(id: :desc)
             .page(params[:page])
    end

    def type
      @type ||= EventType.find(type_id) if type_id.present?
    end

    def type_id
      @type_id ||= params[:type_id]
    end
  end
end
