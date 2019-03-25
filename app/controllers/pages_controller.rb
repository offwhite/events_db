# handles requests for pages routes
class PagesController < ApplicationController
  def home
    ::Pages::Home.new(
      self, params
    ).call
  end
end
