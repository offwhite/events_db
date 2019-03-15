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

  def created_date
    return model.created_at.strftime('%H:%M Today') if
      model.created_at.today?
    model.created_at.strftime('%H:%M %d-%m-%y')
  end

  def formatted_date(attr)
    return '' if model.send(attr).nil?
    model.send(attr).strftime('%A, %B %d %Y')
  end

  def formatted_date_sml(attr)
    return '' if model.send(attr).nil?
    model.send(attr).strftime('%d %B %Y')
  end

  def yes_or_no(flag)
    if model.send(flag) == true
      h.content_tag(:div, flag, class: 'bool yes')
    else
      h.content_tag(:div, flag, class: 'bool no')
    end
  end

  private

  def clean(string)
    return '' if string.nil?
    CGI.escape(string)
  end
end
