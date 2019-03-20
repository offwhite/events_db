class EditControllerAction < ::ControllerAction
  def initialize(controller, params)
    @controller = controller
    @params = params

    return if current_user.present?

    redirect_to('/users/sign_in', notice: 'You need to sign in to do that')
  end
end
