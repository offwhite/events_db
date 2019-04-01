module EventTypes
  class Create < ::AdminControllerAction
    def call
      event_type
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_event_types_path,
        notice: 'Event type added'
      )
    end

    def safe_params
      @safe_params ||= params.require('event_type').permit(
        :name, :description, :event_department_id
      )
    end

    def event_type
      @event_type ||= ::EventTypes::Creator.new(safe_params, current_user).call
    end
  end
end
