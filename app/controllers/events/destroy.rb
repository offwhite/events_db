module Events
  class Destroy < ::AdminControllerAction
    def call
      event.delete
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_events_path,
        notice: 'The event has been deleted'
      )
    end

    def event
      @event ||= Event.find params[:id]
    end
  end
end
