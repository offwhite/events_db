class EditControllerAction < ::ControllerAction
  def initialize(controller, params)
    @controller = controller
    @params = params

    return if current_user.present? && current_user.can_edit?
    redirect_to('/', notice: "You don't have permissions to do that")
  end
end
