class EditControllerAction < ::ControllerAction
  def initialize(controller, params)
    @controller = controller
    @params = params

    return if Rails.env.test?

    return if current_user.present? && current_user.can_edit?

    if current_user.nil?
      redirect_to('/users/sign_in', notice: 'You need to sign in to do that')
      return
    end

    redirect_to(
      '/',
      notice:
        "You don't have the permissions for that. Get in touch if that's wrong."
    )
  end
end
