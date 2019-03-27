# handles requests for logs routes
class LogsController < ApplicationController
  layout 'wide'
  def index
    ::Logs::Index.new(
      self, params
    ).call
  end
end
