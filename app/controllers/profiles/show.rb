module Profiles
  class Show < ::ControllerAction
    def call
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.profile_home_path(username: profile.username)
      )
    end

    def profile
      @profile ||= Profile.find params[:id]
    end
  end
end
