module RoleTypes
  class Lookup < ::ControllerAction
    def call
      expose(role_types, '@role_types')
    end

    private

    def role_types
      @role_types ||=
        RoleType.fuzzy_search(params[:search])
                .limit(20)
    end
  end
end
