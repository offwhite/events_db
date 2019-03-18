module RoleTypes
  class Lookup < ::AdminControllerAction
    def call
      expose(role_types, '@role_types')
    end

    private

    def role_types
      @role_types ||=
        RoleType.matches(params[:search])
                .limit(20)
    end
  end
end
