module Profiles
  class Creator
    def initialize(name)
      @name = name
    end

    def call
      return unless name_clean?
      profile
    end

    private

    attr_reader :name

    def profile
      @profile ||= Profile.create(name: name)
    end

    # TODO - write this
    def name_clean?
      true
    end
  end
end
