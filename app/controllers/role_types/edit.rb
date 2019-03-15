module RoleTypes
  class Edit < ::AdminControllerAction
    def call
      expose(role_type, '@role_type')
    end

    private

    def role_type
      @role_type ||= RoleType.find params[:id]
    end
  end
end
