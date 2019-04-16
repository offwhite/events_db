module Events
  class Update < ::EditControllerAction
    def call
      return if controller.performed?
      return error unless user_can_edit_this?
      return error unless event.update(safe_params)
      logger.call
      redirect
    end

    private

    def user_can_edit_this?
      current_user.admin? || event.owner?(current_user)
    end

    def redirect
      redirect_to(
        controller.events_home_path(id: event, slug: event.slug),
        notice: 'The event has been updated'
      )
    end

    def error
      redirect_to(
        controller.events_home_path(id: event, slug: event.slug),
        notice: 'Something went wrong.'
      )
    end

    def safe_params
      @safe_params ||= params.require('event').permit(
        :name, :description, :event_type_id, :venue_id, :venue_name,
        :venue_address, :town_id, :date
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
