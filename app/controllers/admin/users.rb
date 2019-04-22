module Admin
  class Users < ::AdminControllerAction
    def call
      expose(users, '@users')
      expose(sort_by, '@sort_by')
      expose(sort_direction, '@sort_direction')
    end

    private

    def users
      @users ||=
        User
        .left_joins(:profiles)
        .order("#{sort_by} #{sort_direction} NULLS LAST")
        .page(params[:page])
    end

    def sort_by
      @sort_by ||= params['sort-by'] || 'last_seen'
    end

    def sort_direction
      @sort_direction ||= params['sort-direction'] || 'desc'
    end
  end
end
