module RoleDepartments
  class New < ::AdminControllerAction
    def call
      expose(role_department, '@role_department')
      expose(existing_role_departments, '@existing_role_departments')
    end

    private

    def role_department
      @role_department ||= RoleDepartment.new
    end

    def existing_role_departments
      @existing_role_departments ||= RoleDepartment.order(:name)
    end
  end
end
