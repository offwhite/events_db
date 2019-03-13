module Admin
  class Profiles < ::AdminControllerAction
    def call
      expose(profiles, '@profiles')
    end

    private

    def profiles
      @profiles ||= Profile.order(id: :desc)
    end
  end
end
