module Events
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

    def title
      name.titleize
    end

    def venue_title
      venue.title
    end

    def town_title
      town.title
    end

    def full_title
      "#{name.titleize}, #{venue_title}, #{town_title} - \
      #{date_str}"
    end

    def date_str
      date.strftime('%d %B %Y')
    end

    def date_str_sml
      date.strftime('%d-%m-%y')
    end

    def on_tour?
      tour_id.present?
    end

    def tour_roles
      return [] if tour.nil?
      tour.roles
    end

    def owner?(user)
      user&.id == user_id
    end
  end
end
