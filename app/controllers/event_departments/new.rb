module EventDepartments
  class New < ::AdminControllerAction
    def call
      expose(event_department, '@event_department')
      expose(existing_event_departments, '@existing_event_departments')
    end

    private

    def event_department
      @event_department ||= EventDepartment.new
    end

    def existing_event_departments
      @existing_event_departments ||= EventDepartment.order(:name)
    end
  end
end
