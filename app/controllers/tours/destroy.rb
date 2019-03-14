module Tours
  class Destroy < ::EditControllerAction
    def call
      return perms_error unless can_edit?
      message = tour.delete ? 'Tour deleted' : 'Tour could not be deleted'
      redirect(message)
    end

    private

    def redirect(message)
      redirect_to(
        controller.admin_tours_path,
        notice: message
      )
    end

    def perms_error
      redirect_to(
        controller.root_path, notice: 'You do not have permission to do this'
      )
    end

    def tour
      @tour ||= Tour.find(params[:id])
    end

    def can_edit?
      @can_edit ||= current_user.admin? || current_user == tour.user
    end
  end
end
