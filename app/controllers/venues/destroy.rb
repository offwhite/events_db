module Venues
  class Destroy < ::ControllerAction
    def call
      return redirect if venue.delete
      error
    end

    private

    def redirect
      redirect_to(
        controller.admin_venues_path,
        notice: 'The venue has been deleted'
      )
    end

    def error
      redirect_to(
        controller.edit_venue_path(venue),
        alert: 'The venue could not be deleted - probably has events'
      )
    end

    def venue
      @venue ||= Venue.find params[:id]
    end
  end
end
