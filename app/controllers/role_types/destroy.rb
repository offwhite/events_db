module RoleTypes
  class Destroy < ::AdminControllerAction
    def call
      message = role_type.delete ? 'role type deleted' : 'Cannot delete that'
      redirect message
    end

    private

    def redirect(message)
      redirect_to(
        controller.admin_role_types_path,
        notice: message
      )
    end

    def role_type
      @role_type ||= RoleType.find params[:id]
    end
  end
end
