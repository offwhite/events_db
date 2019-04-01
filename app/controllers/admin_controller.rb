class AdminController < ApplicationController
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

  def venues_map
    ::Admin::VenuesMap.new(
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

  def event_types
    ::Admin::EventTypes.new(
      self, params
    ).call
  end

  def role_types
    ::Admin::RoleTypes.new(
      self, params
    ).call
  end

  def role_departments
    ::Admin::RoleDepartments.new(
      self, params
    ).call
  end

  def event_departments
    ::Admin::EventDepartments.new(
      self, params
    ).call
  end

  def users
    ::Admin::Users.new(
      self, params
    ).call
  end
end
