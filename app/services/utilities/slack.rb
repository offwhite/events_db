module Utilities
  class Slack
    def initialize(string, channel = nil)
      @string = string
      @channel = channel || 'notifications'
    end

    def call
      notifier.post text: message
    end

    private

    attr_reader :string, :channel

    def message
      return string if Rails.env.production?
      "#{string} (#{Rails.env})"
    end

    def notifier
      @notifier ||=
        ::Slack::Notifier.new ENV['SLACK_WEBHOOK_URL'],
                              channel: channel,
                              username: 'Website'
    end
  end
end
