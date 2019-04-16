module Events
  class Create < ::EditControllerAction
    def call
      return render_form if event.errors.any?
      redirect
    end

    private

    def redirect
      # return redirect_to(controller.tour_path(event.tour)) if event.on_tour?
      redirect_to(controller.events_home_path(id: event, slug: event.slug))
    end

    def render_form
      expose(event, '@event')
      expose(departments, '@departments')
      render 'new'
    end

    def safe_params
      @safe_params ||= params.require('event').permit(
        :name, :description, :event_type_id, :venue_id,
        :venue_name, :venue_address, :town_id, :tour_id, :date
      )
    end

    def event
      @event ||= ::Events::Creator.new(safe_params, current_user).call
    end

    def departments
      @departments ||= EventDepartment.all.order(:name)
    end
  end
end
