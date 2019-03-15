module RoleDepartments
  class Create < ::AdminControllerAction
    def call
      return redirect if department.present?
      error
    end

    private

    def redirect
      redirect_to(
        controller.admin_departments_path,
        notice: 'Role Department added'
      )
    end

    def safe_params
      @safe_params ||= params.require('role_department').permit(
        :name, :description
      )
    end

    def department
      @department ||=
        RoleDepartments::Creator.new(safe_params, current_user).call
    end
  end
end
