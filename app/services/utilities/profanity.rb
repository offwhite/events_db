module Utilities
  # any iasa apparently quicker than regex
  class Profanity
    def initialize(string)
      @string = string
    end

    def call
      return false if string.blank?
      black_list.any? { |word| string.include?(word) }
    end

    private

    attr_reader :string

    def black_list
      @black_list ||= %w[fuck shit cunt]
    end
  end
end
