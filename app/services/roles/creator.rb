module Roles
  # creates roles
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      return if profile.nil?
      return existing_role if existing_role.present?
      return false unless role.save
      logger.call
      role
    end

    def role
      @role ||= Role.new(full_params)
    end

    private

    attr_reader :params, :user

    def full_params
      @full_params ||= params.merge(
        creator: user,
        verified: verified?,
        profile_id: profile.id
      )
    end

    def verified?
      @verified ||= user.admin?
    end

    def existing_role
      @existing_role ||=
        Role.find_by(
          profile_id: profile.id,
          event_id: params[:event_id],
          role_type_id: params[:role_type_id]
        )
    end

    def profile
      @profile ||= begin
        return Profile.find params[:profile_id] if params[:profile_id].present?
        Profiles::Creator.new(params[:profile_name], user).call
      end
    end

    def logger
      @logger ||=
        ::Utilities::Logger.new(
          role.parent,
          'role added',
          user,
          profile: ['', "#{profile.title} (#{profile.id})"],
          role_type: ['', "#{role.role_type.name} (#{role.role_type.id})"]
        )
    end
  end
end
