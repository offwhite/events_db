module RoleDepartments
  class Destroy < ::AdminControllerAction
    def call
      message = department.delete ? 'department deleted' : 'Cannot delete that'
      redirect message
    end

    private

    def redirect(message)
      redirect_to(
        controller.admin_departments_path,
        notice: message
      )
    end

    def department
      @department ||= RoleDepartment.find params[:id]
    end
  end
end
