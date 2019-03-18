module Profiles
  class RegisterClaim < ::ControllerAction
    def call
      return success if claimer.call
      error
    end

    private

    def redirect(message)
      redirect_to(
        controller.profile_home_path(username: profile.username),
        notice: message
      )
    end

    def success
      redirect(
        "Congratulations, you just claimed ownership of #{profile.name}"
      )
    end

    def error
      redirect("You can't claim ownership of that profile.")
    end

    def profile
      @profile ||= Profile.find params[:id]
    end

    def claimer
      @claimer ||= Profiles::Claimer.new(profile, current_user)
    end
  end
end
