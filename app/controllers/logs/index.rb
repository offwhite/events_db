module Logs
  class Index < ::AdminControllerAction
    def call
      expose(logs, '@logs')
    end

    private

    def logs
      @logs ||= Log.order(id: :desc).page(params[:page]).per(100)
    end
  end
end
