module Admin
  class Events < ::AdminControllerAction
    def call
      expose(events, '@events')
    end

    private

    def events
      @events ||= Event.order(id: :desc).page(params[:page])
    end
  end
end
