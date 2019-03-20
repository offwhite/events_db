module Events
  class Edit < ::EditControllerAction
    def call
      return if controller.performed?
      return redirect unless user_can_edit_this?
      expose(event, '@event')
    end

    private

    def redirect
      redirect_to(controller.root_path, notice: "You can't do that man.")
    end

    def event
      @event ||= Event.find params[:id]
    end

    def user_can_edit_this?
      current_user.admin? || event.owner?(current_user)
    end
  end
end
