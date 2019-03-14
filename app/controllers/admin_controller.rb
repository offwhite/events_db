class AdminController < ApplicationController
  layout 'admin_application'
  def index
    ::Admin::Index.new(
      self, params
    ).call
  end

  def events
    ::Admin::Events.new(
      self, params
    ).call
  end

  def roles
    ::Admin::Roles.new(
      self, params
    ).call
  end

  def venues
    ::Admin::Venues.new(
      self, params
    ).call
  end

  def profiles
    ::Admin::Profiles.new(
      self, params
    ).call
  end

  def tours
    ::Admin::Tours.new(
      self, params
    ).call
  end
end
