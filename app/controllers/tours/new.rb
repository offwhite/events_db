module Tours
  class New < ::EditControllerAction
    def call
      expose(tour, '@tour')
    end

    private

    def tour
      @tour ||= Tour.new
    end
  end
end
