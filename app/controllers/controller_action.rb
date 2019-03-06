class ControllerAction
  attr_reader :controller, :params, :current_user

  delegate :request,
           :response,
           :render,
           :redirect_to,
           :add_data_layer_param,
           :the_cookies,
           :head,
           :current_user,
           to: :controller

  def initialize(controller, params)
    @controller = controller
    @params = params
  end

  def expose(val, name)
    controller.instance_variable_set(name, val)
  end
end
