module Admin
  class RoleTypes < ::AdminControllerAction
    def call
      expose(departments, '@departments')
    end

    private

    def departments
      @departments ||= RoleDepartment.order(:name)
    end
  end
end
