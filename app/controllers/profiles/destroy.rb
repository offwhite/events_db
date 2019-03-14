module Profiles
  class Destroy < ::AdminControllerAction
    def call
      profile.delete
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_profiles_path,
        notice: 'The profile has been deleted'
      )
    end

    def profile
      @profile ||= Profile.find params[:id]
    end
  end
end
