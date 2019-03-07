module Events
  class BasicPresenter < BasePresenter
    def full_title
      "#{model.name.titleize}, #{model.venue_title}, #{model.town_title} - \
      #{formatted_date_sml(:date)}"
    end

    def created_date
      return model.created_at.strftime('Today - %H:%M:%S') if
        model.created_at.today?
      model.created_at.strftime('%d-%m-%Y - %H:%M:%S')
    end
  end
end
