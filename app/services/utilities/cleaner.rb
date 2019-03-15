module Utilities
  class Cleaner
    def initialize(string)
      @string = string
    end

    def call
      string.gsub(/[^0-9a-z ]/i, '')
    end

    def username
      call.tr(' ', '-')
    end

    private

    attr_reader :string
  end
end
