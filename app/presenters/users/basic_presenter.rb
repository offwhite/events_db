module Users
  class BasicPresenter < BasePresenter
    def permission_level_str
      %w[None User Editor Administrator][model.permission_level]
    end
  end
end
