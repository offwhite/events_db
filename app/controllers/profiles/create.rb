module Profiles
  class Create < ::ControllerAction
    def call
      return perms_error if current_user.nil? || current_user.has_profile?
      return render_form if profile.errors.any?
      claimer.call
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.profile_home_path(username: profile.username),
        notice: 'Congratulations, you now have a CrewdB profile'
      )
    end

    def render_form
      expose(profile, '@profile')
      render 'new'
    end

    def perms_error
      redirect_to(
        controller.root_path,
        notice: 'You do not have permission to do this'
      )
    end

    def safe_params
      @safe_params ||= params.require('profile').permit(
        :name, :id
      )
    end

    def profile
      @profile ||= existing_profile || new_profile
    end

    def existing_profile
      return if safe_params[:id].blank?
      @existing_profile ||= Profile.find safe_params[:id]
    end

    def new_profile
      @new_profile ||=
        Profiles::Creator.new(safe_params[:name], current_user).call
    end

    def claimer
      @claimer ||= Profiles::Claimer.new(profile, current_user)
    end
  end
end
