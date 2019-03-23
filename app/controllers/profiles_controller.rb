# handles requests for searches routes
class ProfilesController < ApplicationController
  def home
    ::Profiles::Home.new(
      self, params
    ).call
  end

  def show
    ::Profiles::Show.new(
      self, params
    ).call
  end

  def edit
    ::Profiles::Edit.new(
      self, params
    ).call
  end

  def update
    ::Profiles::Update.new(
      self, params
    ).call
  end

  def destroy
    ::Profiles::Destroy.new(
      self, params
    ).call
  end

  def lookup
    ::Profiles::Lookup.new(
      self, params
    ).call
  end

  def claim
    ::Profiles::Claim.new(
      self, params
    ).call
  end

  def register_claim
    ::Profiles::RegisterClaim.new(
      self, params
    ).call
  end

  def add_role
    ::Profiles::AddRole.new(
      self, params
    ).call
  end
end
