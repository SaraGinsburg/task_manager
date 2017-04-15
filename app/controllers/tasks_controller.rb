class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
    if @task.save
      redirect_to list_path(@list)
    else
      render '/lists/show'
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :list_id, :status, :due_date)
  end
end
