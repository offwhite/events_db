module Utilities
  # removes all non alpha numeric chars from names
  class Cleaner
    def initialize(string)
      @string = string
    end

    def call
      string.gsub(/[^0-9a-z ]/i, '').strip
    end

    def username
      call.tr(' ', '-')
    end

    private

    attr_reader :string
  end
end
