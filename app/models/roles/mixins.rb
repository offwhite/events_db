module Roles
  module Mixins
    def delete
      self.deleted_at = Time.zone.now
      save!
    end

    def undelete
      self.deleted_at = nil
      save!
    end
  end
end
