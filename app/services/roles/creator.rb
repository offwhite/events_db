module Roles
  # creates roles
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      return existing_role if existing_role.present?
      role
    end

    def role
      @role ||= Role.create(full_params)
    end

    private

    attr_reader :params, :user

    def full_params
      @full_params ||= params.merge(
        creator: user,
        verified: verified?
      )
    end

    def verified?
      @verified ||= user.admin?
    end

    def existing_role
      @existing_role ||=
        Role.find_by(
          profile_id: params[:profile_id],
          event_id: params[:event_id],
          role_type_id: params[:role_type_id]
        )
    end
  end
end
