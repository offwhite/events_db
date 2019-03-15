module RoleTypes
  class Create < ::AdminControllerAction
    def call
      return redirect if role_type.present?
      error
    end

    private

    def redirect
      redirect_to(
        controller.admin_role_types_path,
        notice: 'Role type added'
      )
    end

    def safe_params
      @safe_params ||= params.require('role_type').permit(
        :role_department_id, :name, :description
      )
    end

    def role_type
      @role_type ||=
        RoleTypes::Creator.new(safe_params, current_user).call
    end
  end
end
