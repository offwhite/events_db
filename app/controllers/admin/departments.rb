module Admin
  class Departments < ::AdminControllerAction
    def call
      expose(departments, '@departments')
    end

    private

    def departments
      @departments ||= RoleDepartment.order(:name).page(params[:page])
    end
  end
end
