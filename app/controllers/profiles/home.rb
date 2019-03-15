module Profiles
  class Home < ::ControllerAction
    def call
      redirect if profile.nil?
      expose(profile, '@profile')
    end

    private

    def redirect
      redirect_to(
        controller.root_path,
        notice: "I don't know who that is."
      )
    end

    def profile
      @profile ||= Profile.find_by_username params[:username]
    end
  end
end
