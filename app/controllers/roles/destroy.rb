module Roles
  class Destroy < ::EditControllerAction
    def call
      return perms_error unless can_edit?
      role.delete
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_roles_path,
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
      @can_edit ||= current_user.admin? || current_user == role.profile.user
    end
  end
end
