module Profiles
  class Edit < ::EditControllerAction
    def call
      return error unless can_edit?
      expose(profile, '@profile')
    end

    private

    def error
      redirect_to(
        controller.root_path,
        notice: "You can't do that. Get in touch if that's wrong."
      )
    end

    def can_edit?
      current_user.admin? || current_user == profile.user
    end

    def profile
      @profile ||= Profile.find params[:id]
    end
  end
end
