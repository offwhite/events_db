# handles requests for roles routes
class RolesController < ApplicationController
  def edit
    ::Roles::Edit.new(
      self, params
    ).call
  end

  def new
    ::Roles::New.new(
      self, params
    ).call
  end

  def create
    ::Roles::Create.new(
      self, params
    ).call
  end

  def update
    ::Roles::Update.new(
      self, params
    ).call
  end
end
