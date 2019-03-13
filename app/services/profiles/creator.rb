module Profiles
  class Creator
    def initialize(name)
      @name = name
    end

    def call
      return if contains_profanity?
      profile
    end

    private

    attr_reader :name

    def profile
      @profile ||= Profile.create(
        name: name.titleize,
        ordinal: ordinal
      )
    end

    def contains_profanity?
      @contains_profanity ||= Utilities::Profanity.new(name).call
    end

    def ordinal
      return 0 if dupe_names.empty?
      @ordinal ||= dupe_names.last.ordinal + 1
    end

    def dupe_names
      @dupe_names ||=
        Profile.where('lower(name) = ?', name.downcase).order(:ordinal)
    end
  end
end
