# handles requests for events routes
class EventsController < ApplicationController
  def index
    ::Events::Index.new(
      self, params
    ).call
  end

  def show
    ::Events::Show.new(
      self, params
    ).call
  end

  def edit
    ::Events::Edit.new(
      self, params
    ).call
  end

  def new
    ::Events::New.new(
      self, params
    ).call
  end

  def create
    ::Events::Create.new(
      self, params
    ).call
  end

  def update
    ::Events::Update.new(
      self, params
    ).call
  end

  def destroy
    ::Events::Destroy.new(
      self, params
    ).call
  end

  def lookup
    ::Events::Lookup.new(
      self, params
    ).call
  end

  def clone
    ::Events::Clone.new(
      self, params
    ).call
  end

  def duplicate
    ::Events::Duplicate.new(
      self, params
    ).call
  end
end
