class RoleTypesController < ApplicationController
  def edit
    ::RoleTypes::Edit.new(
      self, params
    ).call
  end

  def new
    ::RoleTypes::New.new(
      self, params
    ).call
  end

  def create
    ::RoleTypes::Create.new(
      self, params
    ).call
  end

  def update
    ::RoleTypes::Update.new(
      self, params
    ).call
  end

  def destroy
    ::RoleTypes::Destroy.new(
      self, params
    ).call
  end
end
