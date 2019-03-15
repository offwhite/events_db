module RoleTypes
  class Update < ::AdminControllerAction
    def call
      logger.call if role_type.update safe_params
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_role_types_path,
        notice: 'The role type has been updated'
      )
    end

    def safe_params
      @safe_params ||= params.require('role_type').permit(
        :name, :description, :role_department_id
      )
    end

    def role_type
      @role_type ||= RoleType.find params.fetch(:id)
    end

    def logger
      @logger ||= ::Utilities::Logger.new(role_type, 'edited', current_user)
    end
  end
end
