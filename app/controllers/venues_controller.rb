# handles requests for venues routes
class VenuesController < ApplicationController
  def show
    ::Venues::Show.new(
      self, params
    ).call
  end
end
