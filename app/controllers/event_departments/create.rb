module EventDepartments
  class Create < ::AdminControllerAction
    def call
      return redirect if department.present?
      error
    end

    private

    def redirect
      redirect_to(
        controller.admin_event_departments_path,
        notice: 'Event Department added'
      )
    end

    def safe_params
      @safe_params ||= params.require('event_department').permit(
        :name, :description
      )
    end

    def department
      @department ||=
        EventDepartments::Creator.new(safe_params, current_user).call
    end
  end
end
