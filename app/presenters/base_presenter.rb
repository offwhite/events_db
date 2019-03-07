# Based heavily on; http://nithinbekal.com/posts/rails-presenters/
class BasePresenter < SimpleDelegator
  def initialize(model, view_context)
    @model = model
    @view_context = view_context
    super(model)
  end

  attr_reader :model, :view_context

  alias v view_context

  def h
    @view_context
  end

  def formatted_date(attr)
    return '' if model.send(attr).nil?
    model.send(attr).strftime('%A, %B %d %Y')
  end

  def formatted_date_sml(attr)
    return '' if model.send(attr).nil?
    model.send(attr).strftime('%d %B %Y')
  end

  private

  def clean(string)
    return '' if string.nil?
    CGI.escape(string)
  end
end
