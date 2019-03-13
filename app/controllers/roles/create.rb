module Roles
  class Create < ::EditControllerAction
    def call
      return redirect if role.present?
      render_form
    end

    private

    def redirect
      return redirect_to(controller.event_path(role.event)) if role.event_role?
      redirect_to(controller.tour_path(id: role.tour.id))
    end

    def render_form
      expose(role, '@role')
      render 'new'
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
