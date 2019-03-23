module Venues
  class BasicPresenter < BasePresenter
    def safe_url
      return model.url if model.url.starts_with? 'http://'
      "http://#{model.url}"
    end
  end
end
