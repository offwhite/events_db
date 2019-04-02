module Roles
  class Destroy < ::ControllerAction
    def call
      return perms_error unless can_edit?
      role.delete
      logger.call
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.event_path(role.event),
        notice: 'The role has been deleted'
      )
    end

    def perms_error
      redirect_to(
        controller.root_path, notice: 'You do not have permission to do this'
      )
    end

    def role
      @roles ||= Role.find(params[:id])
    end

    def can_edit?
      @can_edit ||= current_user.admin? || role.can_edit?(current_user)
    end

    def logger
      @logger ||= ::Utilities::Logger.new(role, 'deleted', current_user)
    end
  end
end
