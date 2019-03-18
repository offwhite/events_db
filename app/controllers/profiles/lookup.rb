module Profiles
  class Lookup < ::ControllerAction
    def call
      expose(profiles, '@profiles')
      expose(query_str, '@query_str')
    end

    private

    def profiles
      @profiles ||=
        Profile.matches(query_str)
               .limit(20)
    end

    def query_str
      @query_str ||= params[:search]
    end
  end
end
