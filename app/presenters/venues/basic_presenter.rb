module Venues
  class BasicPresenter < BasePresenter
    def safe_url
      return model.url if model.url.starts_with? 'http://'
      "http://#{model.url}"
    end

    def address_url
      "https://www.google.co.uk/maps/search/#{name.tr(' ', '+')}+"
        .concat(address.tr(' ', '+').to_s)
    end
  end
end
