module Venues
  class Create < ::EditControllerAction
    def call
      return redirect if venue.persisted?
      render_form
    end

    private

    def redirect
      redirect_to(controller.venues_show_path(venue, venue.slug))
    end

    def render_form
      expose(venue, '@venue')
      render 'new'
    end

    def safe_params
      @safe_params ||= params.require('venue').permit(
        :name, :description, :address, :town_id, :capacity, :url, :phone
      )
    end

    def venue
      @venue ||= ::Venues::Creator.new(safe_params, current_user).call
    end
  end
end
