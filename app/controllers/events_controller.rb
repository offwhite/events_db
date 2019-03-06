# handles requests for events routes
class EventsController < ApplicationController
  def index
    ::Events::Index.new(
      self, params
    ).call
  end
end
