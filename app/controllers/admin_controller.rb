class AdminController < ApplicationController
  layout 'admin_application'
  def index
    ::Admin::Index.new(
      self, params
    ).call
  end
end
