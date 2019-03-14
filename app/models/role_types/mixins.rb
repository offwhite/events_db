module RoleTypes
  module Mixins
    def delete
      return false if roles.any?
      self.deleted_at = Time.zone.now
      save!
    end

    def undelete
      self.deleted_at = nil
      save!
    end
  end
end
