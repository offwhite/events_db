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

    def town
      event&.town
    end

    def venue
      event&.venue
    end

    def coords
      [venue&.latitude, venue.longitude]
    end

    def parent
      return event if event_id.present?
      tour
    end

    def event_role?
      event_id.present?
    end

    def tour_role?
      tour_id.present?
    end

    def venue_title
      venue.title
    end

    def town_title
      town&.title
    end

    def owner?(user)
      profile.user_id == user&.id
    end
  end
end
