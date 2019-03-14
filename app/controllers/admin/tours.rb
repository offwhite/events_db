module Admin
  class Tours < ::AdminControllerAction
    def call
      expose(tours, '@tours')
    end

    private

    def tours
      @tours ||= Tour.order(id: :desc).page(params[:page])
    end
  end
end
