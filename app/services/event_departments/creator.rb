module EventDepartments
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      logger.call if department.present?
      department
    end

    def department
      @department ||= EventDepartment.find_or_create_by(params)
    end

    private

    attr_reader :params, :user

    def logger
      @logger ||=
        ::Utilities::Logger.new(department, 'created', user)
    end
  end
end
