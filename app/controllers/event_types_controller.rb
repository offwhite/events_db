class EventTypesController < ApplicationController
  def edit
    ::EventTypes::Edit.new(
      self, params
    ).call
  end

  def new
    ::EventTypes::New.new(
      self, params
    ).call
  end

  def create
    ::EventTypes::Create.new(
      self, params
    ).call
  end

  def update
    ::EventTypes::Update.new(
      self, params
    ).call
  end

  def destroy
    ::EventTypes::Destroy.new(
      self, params
    ).call
  end
end
