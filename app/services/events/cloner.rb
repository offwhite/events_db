module Events
  class Cloner
    def initialize(old_event, params, user)
      @old_event = old_event
      @params = params
      @user = user
    end

    def call
      return true if existing_event.present?
      return false unless clone
      logger.call
      true
    end

    def event
      @event ||= existing_event || new_event
    end

    private

    attr_reader :old_event, :params, :user

    def clone
      return unless event.save
      roles.each do |role|
        role.update event_id: event.id
      end
      true
    end

    def new_event
      @new_event ||= begin
        e = old_event.dup
        e.attributes = params.merge(user_id: user&.id)
        e
      end
    end

    def existing_event
      @existing_event ||=
        Event.find_by(
          name: new_event.name,
          date: new_event.date,
          venue_id: new_event.venue_id
        )
    end

    def roles
      @roles = old_event.roles.collect(&:dup)
    end

    def logger
      @logger ||= ::Utilities::Logger.new(event, 'created as clone', user)
    end
  end
end
