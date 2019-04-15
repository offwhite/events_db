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

    def recent(limit = 15)
      where('created_at < ?', Time.zone.tomorrow)
        .reorder('created_at desc')
        .limit(limit)
    end
  end
end
