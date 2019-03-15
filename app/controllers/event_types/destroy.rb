module EventTypes
  class Destroy < ::AdminControllerAction
    def call
      message = event_type.delete ? 'event type deleted' : 'Cannot delete that'
      redirect message
    end

    private

    def redirect(message)
      redirect_to(
        controller.admin_event_types_path,
        notice: message
      )
    end

    def event_type
      @event_type ||= EventType.find params[:id]
    end
  end
end
