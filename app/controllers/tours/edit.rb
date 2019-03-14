module Tours
  class Edit < ::EditControllerAction
    def call
      return error unless can_edit?
      expose(tour, '@tour')
    end

    private

    def error
      redirect_to(
        controller.root_path,
        notice: "You can't do that. Get in touch if that's wrong."
      )
    end

    def can_edit?
      current_user.admin? || current_user == tour.user
    end

    def tour
      @tour ||= Tour.find params[:id]
    end
  end
end
