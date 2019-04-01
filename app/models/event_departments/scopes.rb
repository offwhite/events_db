module EventDepartments
  module Scopes
    def deleted
      unscoped.where.not(deleted_at: [nil])
    end
  end
end
