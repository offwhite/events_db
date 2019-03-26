module Profiles
  class Lookup < ::ControllerAction
    def call
      expose(profiles, '@profiles')
      expose(query_str, '@query_str')
    end

    private

    def profiles
      return unclaimed_profiles if only_unclaimed?
      all_profiles
    end

    def unclaimed_profiles
      @unclaimed_profiles ||= Profile.matches(query_str).unclaimed.limit(10)
    end

    def all_profiles
      @all_profiles ||= Profile.matches(query_str).limit(10)
    end

    def query_str
      @query_str ||= params[:search]
    end

    def only_unclaimed?
      @only_unclaimed ||= params[:only_unclaimed] === 'true'
    end
  end
end
