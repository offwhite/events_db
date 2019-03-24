module Profiles
  class CreateRole < ::ControllerAction
    def call
      # cancel if this owner isn't admin or doesnt own this profile
      return error if event.nil? || !role.save
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
        notice: 'Something went wrong'
      )
    end

    def safe_params
      @safe_params ||= params.require('role').permit(
        :role_type_id,
        event_attributes: %i[
          venue_id name event_type_id date(1i) date(2i) date(3i)
          date(1i)
        ]
      )
    end

    # move to event creator service

    def event
      @event ||= existing_event || new_event
    end

    def event_params
      @event_params ||= safe_params[:event_attributes].merge(
        user_id: current_user.id
      )
    end

    def new_event
      @new_event ||= Event.create(event_params)
    end

    def existing_event
      return if params.require('role')['event_id'].blank?
      @existing_event ||= Event.find params.require('role')['event_id']
    end

    def profile
      @profile ||= Profile.find params[:id]
    end

    # move to a role creator

    def role
      @role ||= Role.new(
        profile_id: profile.id,
        role_type_id: safe_params[:role_type_id],
        event_id: event.id,
        creator_id: current_user.id
      )
    end
  end
end
