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
end
