module Users
  class Edit < ::AdminControllerAction
    def call
      expose(user, '@user')
    end

    private

    def user
      @user ||= User.find params[:id]
    end
  end
end
