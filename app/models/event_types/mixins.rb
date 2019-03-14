module EventTypes
  module Mixins
    def delete
      return false if events.any?
      self.deleted_at = Time.zone.now
      save!
    end

    def undelete
      self.deleted_at = nil
      save!
    end
  end
end
