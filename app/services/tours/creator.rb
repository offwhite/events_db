module Tours
  # creates tours
  class Creator
    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      return existing_tour if existing_tour.present?
      tour
    end

    def tour
      @tour ||= Tour.create(full_params)
    end

    private

    attr_reader :params, :user

    def full_params
      @full_params ||= params.merge(
        user: user,
        verified: verified?
      )
    end

    def verified?
      @verified ||= user.admin?
    end

    def existing_tour
      @existing_tour ||= Tour.find_by(name: params[:name])
    end
  end
end
