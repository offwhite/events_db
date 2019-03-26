module Profiles
  # we can have profiles with duplicate names, but we add an ordinal to the
  # profile - james white, james white 2nd, james white 3rd...
  class Creator
    def initialize(name, user = nil)
      @name = name
      @user = user
    end

    def call
      return if dupe_username?
      logger.call if profile.save
      profile
    end

    private

    attr_reader :name, :user

    def profile
      @profile ||= Profile.new(
        name: name.titleize,
        ordinal: ordinal,
        username: username
      )
    end

    def ordinal
      return 1 if dupe_names.empty?
      @ordinal ||= dupe_names.last.ordinal.to_i + 1
    end

    def username
      @username ||= name_cleaner.username + (ordinal < 2 ? '' : "-#{ordinal}")
    end

    def name_cleaner
      @name_cleaner ||= Utilities::Cleaner.new(name.downcase)
    end

    def dupe_names
      @dupe_names ||=
        Profile.where('lower(name) = ?', name.downcase).order(:ordinal)
    end

    def dupe_username?
      @dupe_username ||= Profile.find_by_username(username).present?
    end

    def logger
      @logger ||= ::Utilities::Logger.new(profile, 'profile created', user)
    end
  end
end
