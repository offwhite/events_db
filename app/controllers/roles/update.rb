module Roles
  class Update < ::AdminControllerAction
    def call
      role.update! safe_params
      redirect
    end

    private

    attr_reader :role

    def redirect
      redirect_to(
        controller.admin_roles_path,
        notice: 'The role has been updated'
      )
    end

    def role
      @roles ||= Role.find params[:id]
    end

    def safe_params
      @safe_params ||= params.require('role').permit(
        :profile_id, :event_id, :tour_id, :verified, :role_type_id
      )
    end
  end
end
