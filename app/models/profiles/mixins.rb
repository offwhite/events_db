module Profiles
  module Mixins
    def delete
      roles.update_all deleted_at: Time.zone.now
      self.deleted_at = Time.zone.now
      save!
    end

    def undelete
      roles_inc_deleted.update_all deleted_at: nil
      self.deleted_at = nil
      save!
    end

    def roles_inc_deleted
      roles.unscoped.all
    end

    def unowned?
      user_id.nil?
    end

    def owned?
      user_id.present?
    end
  end
end
