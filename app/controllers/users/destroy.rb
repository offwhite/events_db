module Users
  class Destroy < ::AdminControllerAction
    def call
      ban
      logger.call
      redirect
    end

    private

    def redirect
      redirect_to(
        controller.admin_users_path,
        notice: 'user banned'
      )
    end

    def ban
      user.update banned_at: Time.zone.now
    end

    def user
      @user ||= User.find params[:id]
    end

    def logger
      @logger ||= ::Utilities::Logger.new(user, 'BANNED', current_user, {})
    end
  end
end
