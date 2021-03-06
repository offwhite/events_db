module Admin
  class EventTypes < ::AdminControllerAction
    def call
      expose(departments, '@departments')
    end

    private

    def departments
      @departments ||= EventDepartment.order(:name)
    end
  end
end
