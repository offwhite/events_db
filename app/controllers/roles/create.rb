module Roles
  class Create < ::EditControllerAction
    def call
      return redirect if role.present?
      error
    end

    private

    def redirect
      return redirect_to(controller.event_path(role.event)) if role.event_role?
      redirect_to(controller.tour_path(id: role.tour.id))
    end

    def error
      redirect_to(
        controller.new_role_path(
          event_id: safe_params[:event_id],
          tour_id: safe_params[:tour_id]
        ),
        notice:
          'The name has to be longer than 5 characters and no funny business.'
      )
    end

    def safe_params
      @safe_params ||= params.require('role').permit(
        :event_id, :tour_id, :profile_id, :profile_name, :role_type_id
      )
    end

    def role
      @role ||= ::Roles::Creator.new(safe_params, current_user).call
    end
  end
end
