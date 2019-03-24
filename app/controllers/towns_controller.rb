# handles requests for towns routes
class TownsController < ApplicationController
  def lookup
    ::Towns::Lookup.new(
      self, params
    ).call
  end
end
