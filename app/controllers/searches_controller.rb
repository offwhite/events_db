# handles requests for searches routes
class SearchesController < ApplicationController
  def global
    ::Searches::Global.new(
      self, params
    ).call
  end
end
