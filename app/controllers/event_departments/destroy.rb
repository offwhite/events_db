module EventDepartments
  class Destroy < ::AdminControllerAction
    def call
      message = department.delete ? 'department deleted' : 'Cannot delete that'
      redirect message
    end

    private

    def redirect(message)
      redirect_to(
        controller.admin_event_departments_path,
        notice: message
      )
    end

    def department
      @department ||= EventDepartment.find params[:id]
    end
  end
end
