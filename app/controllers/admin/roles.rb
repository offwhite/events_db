module Admin
  class Roles < ::AdminControllerAction
    def call
      expose(roles, '@roles')
    end

    private

    def roles
      @roles ||= Role.order(id: :desc)
    end
  end
end
