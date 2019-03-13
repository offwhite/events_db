module Profiles
  class BasicPresenter < BasePresenter
    def overview
      "#{model.name} is a #{role_summary} who has worked on \
      #{model.events.count} #{'event'.pluralize(model.events.count)} \
      in #{model.town_titles} \
      "
    end

    def role_summary
      role_type_names.to_sentence
    end
  end
end
