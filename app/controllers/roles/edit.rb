module Roles
  class Edit < ::EditControllerAction
    def call
      expose(role, '@role')
    end

    private

    def role
      @roles ||= Role.find params[:id]
    end
  end
end
