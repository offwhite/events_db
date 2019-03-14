module Profiles
  class Update < ::EditControllerAction
    def call
      return perms_error unless can_edit?
      return render_form unless profile.update! safe_params
      logger.call
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.profile_path(profile),
        notice: 'The profile has been updated'
      )
    end

    def render_form
      expose(profile, '@profile')
      render 'edit'
    end

    def perms_error
      redirect_to(
        controller.profile_path(profile),
        notice: 'You do not have permission to do this'
      )
    end

    def safe_params
      @safe_params ||= params.require('profile').permit(
        :name, :biography, :user_id, :phone, :url, :verified, :vallidated,
        :date_of_birth
      )
    end

    def profile
      @profile ||= Profile.find params.fetch(:id)
    end

    def can_edit?
      current_user.admin? || current_user == profile.user
    end

    def logger
      @logger ||=
        ::Utilities::Logger.new(profile, 'edited', current_user)
    end
  end
end
