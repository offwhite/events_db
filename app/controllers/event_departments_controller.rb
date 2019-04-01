class EventDepartmentsController < ApplicationController
  def edit
    ::EventDepartments::Edit.new(
      self, params
    ).call
  end

  def new
    ::EventDepartments::New.new(
      self, params
    ).call
  end

  def create
    ::EventDepartments::Create.new(
      self, params
    ).call
  end

  def update
    ::EventDepartments::Update.new(
      self, params
    ).call
  end

  def destroy
    ::EventDepartments::Destroy.new(
      self, params
    ).call
  end
end
