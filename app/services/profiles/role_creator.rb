module Profiles
  class RoleCreator
    def initialize(params, event_id, profile, user)
      @params = params
      @event_id = event_id
      @profile = profile
      @user = user
    end

    def call
      if valid_user? && venue.present? && event.save && role.save
        logger.call
        return role
      end
      false
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
        user_id: user.id,
        venue_id: venue.id
      )
    end

    def venue
      @venue ||=
        Venue.find_by_id(params[:event_attributes][:venue_id]) ||
        venue_creator.call
    end

    def venue_creator
      @venue_creator ||= Venues::Creator.new(
        {
          name: params[:event_attributes][:venue_name],
          address: params[:event_attributes][:venue_address],
          town_id: params[:event_attributes][:town_id]
        },
        user
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
      @valid_user ||= user.admin? || user.id == profile.user_id
    end

    def logger
      @logger ||= ::Utilities::Logger.new(role, 'created', user)
    end
  end
end
