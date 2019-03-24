# handles requests for venues routes
class VenuesController < ApplicationController
  def new
    ::Venues::New.new(
      self, params
    ).call
  end

  def create
    ::Venues::Create.new(
      self, params
    ).call
  end

  def show
    ::Venues::Show.new(
      self, params
    ).call
  end

  def edit
    ::Venues::Edit.new(
      self, params
    ).call
  end

  def update
    ::Venues::Update.new(
      self, params
    ).call
  end

  def lookup
    ::Venues::Lookup.new(
      self, params
    ).call
  end
end
