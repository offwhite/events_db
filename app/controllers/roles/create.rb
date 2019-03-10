module Roles
  class Create < ::EditControllerAction
    def call
      return redirect if role.present?
      render_form
    end

    private

    def redirect
      redirect_to(controller.event_path(role.event))
    end

    def render_form
      expose(role, '@role')
      render 'new'
    end

    def safe_params
      @safe_params ||= params.require('role').permit(
        :event_id, :profile_id, :role_type_id
      )
    end

    def role
      @role ||= ::Roles::Creator.new(safe_params, current_user).call
    end
  end
end
