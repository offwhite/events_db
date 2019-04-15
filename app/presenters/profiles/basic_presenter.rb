module Profiles
  class BasicPresenter < BasePresenter
    def overview
      return unknown_summary if model.roles.count.zero?
      regular_summary
    end

    def unknown_summary
      "#{model.name} #{hometown_summary} hasn't recorded any jobs. We don't \
      really know what they \
      do, but we think they're really important and clever."
    end

    def regular_summary
      "#{model.name} is a #{role_summary} #{hometown_summary} who has worked \
      on at least #{model.events.count} \
      #{'event'.pluralize(model.events.count)} \
      in #{locale_summary} \
      "
    end

    def locale_summary
      if model.country_titles.length == 1
        "#{model.town_titles}, #{model.country_titles.first}"
      else
        model.town_and_country_titles
      end
    end

    def hometown_summary
      return '' if model.hometown.nil?
      "based in #{model.hometown.title}"
    end

    def role_summary
      role_type_names.to_sentence
    end
  end
end
