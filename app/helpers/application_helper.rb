module ApplicationHelper
  def present(model, presenter_class = nil, *args)
    klass = presenter_class ||
            "#{model.class.to_s.pluralize}::BasicPresenter".constantize
    presenter = klass.new(model, self, *args)
    yield(presenter) if block_given?
  end
end
