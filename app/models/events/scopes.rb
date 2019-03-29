module Events
  module Scopes
    def deleted
      unscoped.where.not(deleted_at: [nil])
    end

    def recent(limit = 10)
      where('date < ?', Time.zone.tomorrow)
        .reorder('date desc')
        .limit(limit)
    end
  end
end
