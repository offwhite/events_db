module Events
  class Update < ::EditControllerAction
    def call
      return render_form unless event.update! safe_params
      logger.call
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.event_path(event),
        notice: 'The event has been updated'
      )
    end

    def render_form
      expose(event, '@event')
      render 'edit'
    end

    def safe_params
      @safe_params ||= params.require('event').permit(
        :name, :description, :event_type_id, :venue_id, :date
      )
    end

    def event
      @event ||= Event.find params.fetch(:id)
    end

    def logger
      @logger ||= ::Utilities::Logger.new(event, 'edited', current_user)
    end
  end
end
