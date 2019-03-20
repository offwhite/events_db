module Roles
  class Update < ::AdminControllerAction
    def call
      return if controller.performed?
      role.update! safe_params
      logger.call
      redirect
    end

    private

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

    def logger
      @logger ||=
        ::Utilities::Logger.new(
          role.parent, 'role edited', current_user,
          role.previous_changes.merge(
            role_id: [role.id, role.id]
          )
        )
    end
  end
end
