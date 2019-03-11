# handles requests for roles routes
class ToursController < ApplicationController
  def new
    ::Tours::New.new(
      self, params
    ).call
  end

  def create
    ::Tours::Create.new(
      self, params
    ).call
  end

  def show
    ::Tours::Show.new(
      self, params
    ).call
  end
end
