module EventTypes
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      logger.call unless event_type.errors.any?
      event_type
    end

    def event_type
      @event_type ||= EventType.find_or_create_by(params)
    end

    private

    attr_reader :params, :user

    def logger
      @logger ||= ::Utilities::Logger.new(event_type, 'created', user)
    end
  end
end
