module Tours
  module Mixins
    def delete
      events.each(&:delete)
      roles.update_all deleted_at: Time.zone.now
      self.deleted_at = Time.zone.now
      save!
    end

    def undelete
      events.each(&:undelete)
      roles.update_all deleted_at: nil
      self.deleted_at = nil
      save!
    end
  end
end
