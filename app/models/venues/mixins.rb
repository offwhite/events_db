module Venues
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

    def title
      name.titleize
    end

    def full_title
      [title, town&.title, town&.country_iso].join(', ')
    end

    def town_title
      town&.title
    end

    def future_events
      events.where('date > ?', Time.zone.today).reorder(date: :asc)
    end

    def past_events
      events.where('date < ?', Time.zone.today)
    end
  end
end
