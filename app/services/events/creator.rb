module Events
  # creates events
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      return existing_event if existing_event.present?
      logger.call if event.present?
      event
    end

    def event
      @event ||= Event.create(full_params)
    end

    private

    attr_reader :params, :user

    def full_params
      @full_params ||= params.merge(
        user_id: user.id,
        verified: verified?
      )
    end

    def verified?
      @verified ||= user.admin?
    end

    def event_date
      return params[:date] if params[:date].present?
      "#{params['date(3i)']}-#{params['date(2i)']}-#{params['date(1i)']}"
    end

    def existing_event
      @existing_event ||=
        Event.find_by(
          name: params[:name],
          date: event_date,
          venue_id: params[:venue_id]
        )
    end

    def logger
      @logger ||= ::Utilities::Logger.new(event, 'created', user)
    end
  end
end
