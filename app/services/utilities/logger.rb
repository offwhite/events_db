module Utilities
  class Logger
    def initialize(record, action = '', user = nil, change_set = nil)
      @record = record
      @action = action
      @user = user
      @change_set = change_set
    end

    def call
      log.save!
    end

    private

    attr_reader :record, :action, :user, :change_set

    def log
      @log ||= Log.new(
        record: record,
        action: action,
        user: user,
        change_values: changes
      )
    end

    def changes
      @changes ||= change_set || record&.previous_changes
    end
  end
end
