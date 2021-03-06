module Towns
  module Mixins
    def delete
      return false if venues.any?
      self.deleted_at = Time.zone.now
      save!
    end

    def undelete
      self.deleted_at = nil
      save!
    end

    def country_title
      country&.title
    end

    def country_iso
      country&.iso
    end

    def title
      name.titleize
    end

    def full_title
      [title, state&.name, country&.iso].compact.join(', ')
    end
  end
end
