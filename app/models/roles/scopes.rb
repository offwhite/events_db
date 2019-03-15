module Roles
  module Scopes
    def deleted
      unscoped.where.not(deleted_at: [nil])
    end

    def ordered_by_department
      includes(:role_type)
        .includes(role_type: :role_department)
        .order('role_departments.name, role_types.name')
    end
  end
end
