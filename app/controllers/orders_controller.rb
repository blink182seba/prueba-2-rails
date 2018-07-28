class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    @task = Task.find(params[:task_id])
    @order = Order.new(task: @task, user: current_user)
      if @order.save
        redirect_to tasks_path, notice: 'La tarea ha sido ingresada'
      else
        redirect_to tasks_path, alert: @order.errors.full_messages
      end
  end
  def completed
    @orders = current_user.orders
  end
end
