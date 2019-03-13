module Admin
  class Venues < ::AdminControllerAction
    def call
      expose(venues, '@venues')
    end

    private

    def venues
      @venues ||= Venue.order(id: :desc).page(params[:page])
    end
  end
end
