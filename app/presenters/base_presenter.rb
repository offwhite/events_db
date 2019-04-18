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
    format_date(model.created_at)
  end

  def formatted_date(attr)
    return '' if model.send(attr).nil?
    model.send(attr).strftime('%A, %B %d %Y')
  end

  def formatted_date_sml(attr)
    return '' if model.send(attr).nil?
    model.send(attr).strftime('%d %B %Y')
  end

  def format_date(date)
    return date.strftime('%H:%M Today') if
      date.today?
    return date.strftime('%H:%M Yesterday') if
       date.to_date == Date.yesterday
    "#{date.strftime('%H:%M')} - #{h.time_ago_in_words(date)} ago"
  end

  def formatted_time_sml(attr)
    return '' if model.send(attr).nil?
    format_date(model.send(attr))
  end

  def yes_or_no(flag)
    if model.send(flag) == true
      h.content_tag(:div, flag, class: 'bool yes')
    else
      h.content_tag(:div, flag, class: 'bool no')
    end
  end

  def activate_links(string)
    string.gsub(
      URI::DEFAULT_PARSER.make_regexp,
      '<a href="\0" target="_blank">\0</a>'
    ).html_safe
  end

  private

  def clean(string)
    return '' if string.nil?
    CGI.escape(string)
  end
end
