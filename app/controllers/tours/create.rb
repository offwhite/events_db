module Tours
  class Create < ::EditControllerAction
    def call
      return redirect if tour.id.present?
      render_form
    end

    private

    def redirect
      redirect_to(controller.tour_path(tour))
    end

    def render_form
      expose(tour, '@tour')
      render 'new'
    end

    def safe_params
      @safe_params ||= params.require('tour').permit(:name, :tour_type_id)
    end

    def tour
      @tour ||= ::Tours::Creator.new(safe_params, current_user).call
    end
  end
end
