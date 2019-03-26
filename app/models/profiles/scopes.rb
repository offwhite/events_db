module Profiles
  module Scopes
    def deleted
      unscoped.where.not(deleted_at: [nil])
    end

    def claimed
      where.not(user_id: [nil])
    end

    def unclaimed
      where(user_id: [nil])
    end
  end
end
