class UsersController < ApplicationController
  def edit
    ::Users::Edit.new(
      self, params
    ).call
  end

  def update
    ::Users::Update.new(
      self, params
    ).call
  end

  def destroy
    ::Users::Destroy.new(
      self, params
    ).call
  end
end
