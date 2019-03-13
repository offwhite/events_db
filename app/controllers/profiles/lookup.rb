module Profiles
  class Lookup < ::ControllerAction
    def call
      expose(profiles, '@profiles')
    end

    private

    def profiles
      @profiles ||=
        Profile.matches(params[:search])
               .limit(20)
    end
  end
end
