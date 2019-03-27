module Logs
  class Index < ::AdminControllerAction
    def call
      expose(logs, '@logs')
    end

    private

    def logs
      @logs ||= base_query.order(id: :desc).page(params[:page]).per(500)
    end

    def base_query
      return Log.where(user_id: params[:user_id]) if params[:user_id].present?
      Log
    end
  end
end
