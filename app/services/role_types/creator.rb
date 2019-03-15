module RoleTypes
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      logger.call if role_type.present?
      role_type
    end

    def role_type
      @role_type ||= RoleType.find_or_create_by(params)
    end

    private

    attr_reader :params, :user

    def logger
      @logger ||= ::Utilities::Logger.new(role_type, 'created', user)
    end
  end
end
