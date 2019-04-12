module Profiles
  class CreateRole < ::ControllerAction
    def call
      return error if role.nil?
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.profile_home_path(username: profile.username),
        notice: 'The job has been added'
      )
    end

    def error
      redirect_to(
        controller.profile_home_path(username: profile.username),
        alert: role_creator.errors
      )
    end

    def safe_params
      @safe_params ||= params.require('role').permit(
        :role_type_id,
        event_attributes: %i[
          venue_id venue_name venue_address town_id
          name event_type_id
          date(1i) date(2i) date(3i)
        ]
      )
    end

    def profile
      @profile ||= Profile.find params[:id]
    end

    def role
      @role ||= role_creator.call
    end

    def role_creator
      @role_creator ||= ::Profiles::RoleCreator.new(
        safe_params,
        params.require('role')['event_id'],
        profile,
        current_user
      )
    end
  end
end
