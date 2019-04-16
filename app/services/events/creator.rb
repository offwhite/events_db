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
        verified: verified?,
        venue_id: venue&.id
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
          venue_id: venue&.id
        )
    end

    def venue
      @venue ||=
        Venue.find_by_id(params[:venue_id]) ||
        venue_creator.call
    end

    def venue_creator
      @venue_creator ||= Venues::Creator.new(
        {
          name:    params[:venue_name],
          address: params[:venue_address],
          town_id: params[:town_id]
        },
        user
      )
    end

    def logger
      @logger ||= ::Utilities::Logger.new(event, 'created', user)
    end
  end
end
