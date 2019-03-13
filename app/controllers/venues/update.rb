module Venues
  class Update < ::AdminControllerAction
    def call
      return redirect if venue.update! safe_params
      render_form
    end

    private

    def redirect
      redirect_to(
        controller.venue_path(venue),
        notice: 'The venue has been updated'
      )
    end

    def render_form
      expose(venue, '@venue')
      render 'edit'
    end

    def safe_params
      @safe_params ||= params.require('venue').permit(
        :name, :description, :address, :town_id, :capacity, :url, :phone
      )
    end

    def venue
      @venue ||= Venue.find params.fetch(:id)
    end
  end
end
