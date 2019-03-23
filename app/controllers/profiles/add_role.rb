module Profiles
  class AddRole < ::ControllerAction
    def call

      # cancel if this owner isn't admin or doesnt own this profile
      expose(profile, '@profile')
    end

    private

    def profile
      @profile ||= Profile.find params[:id]
    end
  end
end
