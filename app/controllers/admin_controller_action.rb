class AdminControllerAction < ::ControllerAction
  def initialize(controller, params)
    @controller = controller
    @params = params

    return if Rails.env.test?

    return if current_user.present? && current_user.admin?

    redirect_to('/', notice: 'Unknown route')
  end
end
