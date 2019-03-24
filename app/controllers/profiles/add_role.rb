module Profiles
  class AddRole < ::ControllerAction
    def call
      # cancel if this owner isn't admin or doesnt own this profile
      expose(profile, '@profile')
      expose(role, '@role')
    end

    private

    def profile
      @profile ||= Profile.find params[:id]
    end

    def role
      @role ||= Role.new(
        profile_id: profile.id,
        event: event
      )
    end

    def event
      @event ||= Event.new(date: Time.zone.today)
    end
  end
end
