module Profiles
  class RoleCreator
    def initialize(params, event_id, profile, user)
      @params = params
      @event_id = event_id
      @profile = profile
      @user = user
    end

    def call
      @call ||= role if valid_user? && event.save && role.save
    end

    def errors
      return 'Invalid permissions' unless valid_user?
      return event.errors.full_messages.to_sentence if event.errors.any?
      role.errors.full_messages.to_sentence
    end

    private

    attr_reader :params, :event_id, :profile, :user

    def role
      @role ||= Role.new(
        profile_id:   profile.id,
        role_type_id: params[:role_type_id],
        event_id:     event.id,
        creator_id:   user.id
      )
    end

    def event
      @event ||= existing_event || new_event
    end

    def event_params
      @event_params ||= params[:event_attributes].merge(
        user_id: user.id
      )
    end

    def new_event
      @new_event ||= Event.new(event_params)
    end

    def existing_event
      return if event_id.blank?
      @existing_event ||= Event.find event_id
    end

    def valid_user?
      user.admin? || user.id == profile.user_id
    end
  end
end
