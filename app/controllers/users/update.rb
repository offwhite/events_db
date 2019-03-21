module Users
  class Update < ::AdminControllerAction
    def call
      return error unless user.update safe_params
      logger.call
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_users_path,
        notice: 'changes saved'
      )
    end

    def error
      redirect_to(
        controller.edit_user_path(user),
        notice: errors
      )
    end

    def errors
      user.errors.messages.collect do |attr, err|
        "#{attr}: #{err.join(', ')}"
      end.to_sentence
    end

    def safe_params
      @safe_params ||= params.require('user').permit(
        :email, :permission_level
      )
    end

    def user
      @user ||= User.find params[:id]
    end

    def logger
      @logger ||= ::Utilities::Logger.new(user, 'edited', current_user, {})
    end
  end
end
