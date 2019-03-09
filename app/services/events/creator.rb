module Events
  # creates events
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      @call ||= event.save!
    end

    def event
      @event ||= Event.new full_params
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
  end
end
