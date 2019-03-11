module Tours
  class Show < ::EditControllerAction
    def call
      expose(tour, '@tour')
    end

    private

    def tour
      @tour ||= Tour.find params[:id]
    end
  end
end
