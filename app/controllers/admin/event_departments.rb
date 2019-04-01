module Admin
  class EventDepartments < ::AdminControllerAction
    def call
      expose(departments, '@departments')
    end

    private

    def departments
      @departments ||= EventDepartment.order(:name).page(params[:page])
    end
  end
end
