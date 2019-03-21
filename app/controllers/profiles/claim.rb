module Profiles
  class Claim < ::ControllerAction
    def call
      expose(profile, '@profile')
      expose(user, '@user')
    end

    private

    def profile
      @profile ||= Profile.find params[:id]
    end

    def user
      @user ||= User.new
    end
  end
end
