module Towns
  class Lookup < ::ControllerAction
    def call
      expose(towns, '@towns')
      expose(query_str, '@query_str')
    end

    private

    def towns
      @towns ||=
        Town.fuzzy_search(query_str)
            .limit(20)
    end

    def query_str
      @query_str ||= params[:search]
    end
  end
end
