module Profiles
  class BasicPresenter < BasePresenter
    def overview
      "#{model.name} is a #{role_summary} working in #{model.town_titles}"
    end

    def role_summary
      role_type_names.to_sentence
    end
  end
end
