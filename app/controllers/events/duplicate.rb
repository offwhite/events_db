module Events
  class Duplicate < ::EditControllerAction
    def call
      return if controller.performed?
      return success if cloner.call
      error
    end

    private

    def success
      redirect_to(
        controller.event_path(cloner.event),
        notice: 'Event cloned'
      )
    end

    def error
      redirect_to(
        controller.event_path(id: params[:id]),
        alert: cloner.event.errors.full_messages.to_sentence
      )
    end

    def cloner
      @cloner ||= ::Events::Cloner.new(old_event, safe_params, current_user)
    end

    def safe_params
      @safe_params ||= params.require('event').permit(
        :venue_id, :date
      )
    end

    def old_event
      @old_event ||= Event.find params[:id]
    end
  end
end
