module Profiles
  module Mixins
    def delete
      roles.update_all deleted_at: Time.zone.now
      self.deleted_at = Time.zone.now
      self.username = "#{username}_deleted_at_#{Time.zone.now.to_i}"
      save!
    end

    def undelete
      roles_inc_deleted.update_all deleted_at: nil
      self.deleted_at = nil
      self.username = username.split('_deleted_at_').first
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

    def title
      name.titleize + ordinal_str
    end

    def ordinal_str
      return '' if ordinal < 2
      " (#{ordinal.ordinalize})"
    end

    def roles_coords
      roles.collect(&:coords)
    end

    def role_type_names
      role_types.collect(&:name)
    end

    def role_types
      roles.collect(&:role_type).uniq
    end

    def town_titles
      roles.collect(&:town_title).uniq.to_sentence
    end

    def town_titles_sml
      roles.collect(&:full_town_title).uniq[0..3].to_sentence
    end

    def town_and_country_titles
      roles.collect(&:town_and_country_title).uniq.to_sentence
    end

    def country_titles
      @country_titles ||= roles.collect(&:country_title).uniq
    end

    def events
      roles.collect(&:event).uniq
    end

    def owner?(user)
      user_id.present? && (user&.id == user_id)
    end

    def future_roles
      roles.joins(:event)
           .where('events.date >= ?', Time.zone.today)
           .reorder('events.date asc')
    end

    def past_roles
      roles.joins(:event)
           .where('events.date < ?', Time.zone.today)
           .reorder('events.date desc')
    end

    def role_coords
      roles.collect do |role|
        role.coords.push role.venue_title
      end.uniq
    end

    def most_recently_added_role
      roles.reorder('created_at desc').limit(1).first
    end
  end
end
