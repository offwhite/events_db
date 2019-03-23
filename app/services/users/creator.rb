module Users
  class Creator
    def initialize(params)
      @params = params
    end

    def call
      @call ||= user if user.save
    end

    def errors
      call
      @errors ||= user.errors.full_messages.to_sentence
    end

    private

    attr_reader :params

    def user
      @user ||= User.new(params)
    end
  end
end
