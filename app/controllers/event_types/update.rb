module EventTypes
  class Update < ::AdminControllerAction
    def call
      logger.call if event_type.update safe_params
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_event_types_path,
        notice: 'The event type has been updated'
      )
    end

    def safe_params
      @safe_params ||= params.require('event_type').permit(
        :name
      )
    end

    def event_type
      @event_type ||= EventType.find params.fetch(:id)
    end

    def logger
      @logger ||= ::Utilities::Logger.new(event_type, 'edited', current_user)
    end
  end
end
