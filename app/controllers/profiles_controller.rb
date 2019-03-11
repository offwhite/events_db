# handles requests for searches routes
class ProfilesController < ApplicationController
  def show
    ::Profiles::Show.new(
      self, params
    ).call
  end
end
