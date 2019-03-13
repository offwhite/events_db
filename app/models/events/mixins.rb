module Events
  module Mixins
    def delete
      roles.update_all deleted_at: Time.zone.now
      self.deleted_at = Time.zone.now
      save!
    end

    def undelete
      all_roles.update_all deleted_at: nil
      self.deleted_at = nil
      save!
    end

    def all_roles
      roles.unscoped.all
    end
  end
end
