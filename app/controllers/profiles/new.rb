module Profiles
  class New < ::ControllerAction
    def call
      return error if current_user.has_profile?
      expose(profile, '@profile')
    end

    private

    def error
      redirect_to(
        controller.root_path,
        notice: 'Looks like you already have a profile.'
      )
    end

    def profile
      @profile ||= Profile.new
    end
  end
end
