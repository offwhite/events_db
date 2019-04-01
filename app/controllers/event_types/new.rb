module EventTypes
  class New < ::AdminControllerAction
    def call
      expose(event_type, '@event_type')
      expose(department, '@department')
    end

    private

    def event_type
      @event_type ||= EventType.new event_department_id: department.id
    end

    def department
      @department ||= EventDepartment.find params[:event_department_id]
    end
  end
end
