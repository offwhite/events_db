module RoleTypes
  class New < ::AdminControllerAction
    def call
      expose(role_type, '@role_type')
      expose(department, '@department')
    end

    private

    def role_type
      @role_type ||= RoleType.new(role_department: department)
    end

    def department
      @department ||= RoleDepartment.find params[:role_department_id]
    end
  end
end
