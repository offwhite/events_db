module Profiles
  class AddRole < ::ControllerAction
    def call
      return error unless valid_request?
      expose(profile, '@profile')
      expose(role, '@role')
      expose(departments, '@departments')
    end

    private

    def error
      redirect_to(
        controller.root_path,
        alert: "You're not allowed to do that"
      )
    end

    def profile
      @profile ||= Profile.find params[:id]
    end

    def role
      @role ||= Role.new(
        profile_id: profile.id,
        event: event
      )
    end

    def event
      @event ||= Event.new(date: Time.zone.today)
    end

    def departments
      @departments ||= EventDepartment.all.order(:name)
    end

    def valid_request?
      current_user&.admin? || current_user&.id = profile.user_id
    end
  end
end
