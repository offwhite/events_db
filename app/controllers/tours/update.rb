module Tours
  class Update < ::AdminControllerAction
    def call
      tour.update! safe_params
      logger.call
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_tours_path,
        notice: 'The tour has been updated'
      )
    end

    def tour
      @tours ||= Tour.find params[:id]
    end

    def safe_params
      @safe_params ||= params.require('tour').permit(
        :name, :tour_type_id, :verified
      )
    end

    def logger
      @logger ||=
        ::Utilities::Logger.new(
          tour, 'tour edited', current_user
        )
    end
  end
end
