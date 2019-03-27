module Logs
  class BasicPresenter < BasePresenter
    def model_link
      return default_model_link if model.record_id.nil?
      if %w[role profile event user venue].include? model.record_type.downcase
        return record_link(model.record_type.downcase)
      end
      default_model_link
    end

    def record_link(klass)
      h.link_to(
        klass.titleize,
        h.send("edit_#{klass}_path", id: model.record_id),
        target: '_blank'
      )
    end

    def default_model_link
      "#{model.record_type} (#{model.record_id})"
    end
  end
end
