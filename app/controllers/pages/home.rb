module Pages
  class Home < ::ControllerAction
    def call
      expose(recent_events, '@recent_events')
      expose(recent_roles_by_profile, '@recent_roles')
    end

    private

    def recent_events
      @recent_events ||= Event.recent
    end

    def recent_roles_by_profile
      Role.group(:profile_id).count.collect do |id, _count|
        Profile.find(id).most_recently_added_role
      end.sort_by(&:created_at).reverse
    end

    def recent_roles
      @recent_roles ||= Role.recent(1000)
    end
  end
end
