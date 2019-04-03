class RoleDepartmentsController < ApplicationController
  def new
    ::RoleDepartments::New.new(
      self, params
    ).call
  end

  def create
    ::RoleDepartments::Create.new(
      self, params
    ).call
  end

  def destroy
    ::RoleDepartments::Destroy.new(
      self, params
    ).call
  end
end
