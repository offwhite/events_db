# handles requests for venues routes
class VenuesController < ApplicationController
  def show
    ::Venues::Show.new(
      self, params
    ).call
  end

  def edit
    ::Venues::Edit.new(
      self, params
    ).call
  end

  def update
    ::Venues::Update.new(
      self, params
    ).call
  end
end
