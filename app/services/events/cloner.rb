module Events
  class Cloner
    def initialize(old_event, params, user)
      @old_event = old_event
      @params = params
      @user = user
    end

    def call
      if clone
        logger.call
        return true
      end
      false
    end

    def event
      @event ||= old_event.dup
    end

    private

    attr_reader :old_event, :params, :user

    def clone
      return unless event.update params
      roles.each do |role|
        role.update event_id: event.id
      end
      true
    end

    def roles
      @roles = old_event.roles.collect(&:dup)
    end

    def logger
      @logger ||= ::Utilities::Logger.new(event, 'created as clone', user)
    end
  end
end
