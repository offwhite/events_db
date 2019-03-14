module Tours
  class Show < ::ControllerAction
    def call
      expose(tour, '@tour')
    end

    private

    def tour
      @tour ||= Tour.find params[:id]
    end
  end
end
