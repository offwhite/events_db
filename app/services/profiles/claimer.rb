module Profiles
  class Claimer
    def initialize(profile, user)
      @profile = profile
      @user = user
    end

    def call
      return false if user.has_profile? || profile.owned?
      profile.user_id = user.id
      retrun false unless profile.save
      logger.call
      notifier.call
    end

    private

    attr_reader :profile, :user

    def logger
      @logger ||= ::Utilities::Logger.new(profile, 'claimed', user)
    end

    def notifier
      @notifier ||= ::Utilities::Slack.new(
        "Claimed: #{user.email} claimed ownership of #{profile.title}"
      )
    end
  end
end
