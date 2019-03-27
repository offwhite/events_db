module Profiles
  class BasicPresenter < BasePresenter
    def overview
      return unknown_summary if model.roles.count.zero?
      regular_summary
    end

    def unknown_summary
      "#{model.name} hasn't recorded any jobs. We don't really know what they \
      do, but we think they're really important and clever."
    end

    def regular_summary
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
