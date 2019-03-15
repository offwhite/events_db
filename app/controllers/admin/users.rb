module Admin
  class Users < ::AdminControllerAction
    def call
      expose(users, '@users')
    end

    private

    def users
      @users ||= User.order(:email).page(params[:page])
    end
  end
end
