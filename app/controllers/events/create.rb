module Events
  class Create < ::EditControllerAction
    def call
      return render_form if event.errors.any?
      redirect
    end

    private

    def redirect
      return redirect_to(controller.tour_path(event.tour)) if event.on_tour?
      redirect_to(controller.event_path(event))
    end

    def render_form
      expose(event, '@event')
      render 'new'
    end

    def safe_params
      @safe_params ||= params.require('event').permit(
        :name, :description, :event_type_id, :venue_id, :tour_id, :date
      )
    end

    def event
      @event ||= ::Events::Creator.new(safe_params, current_user).call
    end
  end
end
