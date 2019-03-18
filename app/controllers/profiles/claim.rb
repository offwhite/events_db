module Profiles
  class Claim < ::ControllerAction
    def call
      expose(profile, '@profile')
    end

    private

    def profile
      @profile ||= Profile.find params[:id]
    end
  end
end
