module Profiles
  class RegisterClaim < ::ControllerAction
    def call
      return error(user_creator.errors) if user.nil?
      return success if claimer.call
      error("You can't claim ownership of that profile.")
    end

    private

    def error(message)
      redirect_to(
        controller.profiles_claim_path(id: profile.id),
        alert: message
      )
    end

    def success
      redirect_to(
        controller.profile_home_path(username: profile.username),
        notice:
          "Congratulations, you just claimed ownership of #{profile.title}"
      )
    end

    def profile
      @profile ||= Profile.find params[:id]
    end

    def claimer
      @claimer ||= Profiles::Claimer.new(profile, user)
    end

    def user
      @user ||= current_user || user_creator.call
    end

    def user_creator
      @user_creator ||= ::Users::Creator.new(user_params)
    end

    def user_params
      @user_params ||= params.require('user').permit(
        :email, :password, :password_confirmation
      )
    end
  end
end
