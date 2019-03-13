# handles requests for searches routes
class ProfilesController < ApplicationController
  def show
    ::Profiles::Show.new(
      self, params
    ).call
  end

  def edit
    ::Profiles::Edit.new(
      self, params
    ).call
  end

  def update
    ::Profiles::Update.new(
      self, params
    ).call
  end

  def lookup
    ::Profiles::Lookup.new(
      self, params
    ).call
  end
end
