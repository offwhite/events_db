module Events
  class BasicPresenter < BasePresenter
    def created_date
      return model.created_at.strftime('Today - %H:%M:%S') if
        model.created_at.today?
      model.created_at.strftime('%d-%m-%Y - %H:%M:%S')
    end
  end
end
