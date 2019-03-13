module Admin
  class Profiles < ::AdminControllerAction
    def call
      expose(profiles, '@profiles')
    end

    private

    def profiles
      @profiles ||= Profile.order(id: :desc).page(params[:page])
    end
  end
end
