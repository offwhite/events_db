module Users
  module Mixins
    def account_created
      ::Utilities::Slack.new("New user: #{email} has signed up").call
    end
  end
end
