class TaskController < ApplicationController

  def new
    @task_list = TaskList.find(params[:id])
    @task = Task.new
    @task.task_list_id = params[:id]
  end

  def create
    p params
    @task = Task.new
    @task.name = params[:task][:name]
    @task.datetime = Date.new(params["datetime"]["year"].to_i, params["datetime"]["month"].to_i, params["datetime"]["day"].to_i)
    @task.task_list_id = params[:task][:task_list_id]
    if @task.save
      redirect_to "/"
    else
      render :new
    end
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task was deleted successfully"
    redirect_to "/"
  end

  def complete
    p params
    @task = Task.find(params[:id])
    @task_list = TaskList.find_by(id: @task.task_list_id)
    p "3" * 80
    @task.complete =params[:complete] ="1"
    @task.save!

    redirect_to "/complete/#{@task_list.id}/task"
  end

  def complete_task
    @task = Task.where(task_list_id: params[:id], complete: "t").order(:datetime)
    @task_list = TaskList.find(params[:id])
  end

end