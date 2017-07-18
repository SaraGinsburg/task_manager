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

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.update(task_params)
    if @task.save
      redirect_to list_path(@list)
    else
      render '/lists/show'
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_path(@list) }
      format.json { render json: @list }
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :list_id, :status, :due_date)
  end
end
