module Events
  class Create < ::EditControllerAction
    def call
      return redirect if creator.call
      render_form
    end

    private

    def redirect
      redirect_to(
        controller.event_path(creator.event),
        notice: 'The event has been added'
      )
    end

    def render_form
      expose(creator.event, '@event')
      render 'edit'
    end

    def safe_params
      @safe_params ||= params.require('event').permit(
        :name, :description, :event_type_id, :venue_id, :date
      )
    end

    def creator
      @creator ||= ::Events::Creator.new(safe_params, current_user)
    end
  end
end
