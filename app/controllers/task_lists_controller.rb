class TaskListsController < ApplicationController
  # skip_before_filter :verify_authenticity_token

  def index
    @task_lists = TaskList.order(:name)
  end

  def add_task_get
    @task_list = TaskList.new
    render :add_task
  end

  def add_task_post
    if params[:task_list][:name] == ""
      flash[:error] = "Your task could not be created"
      redirect_to "/add_task"
    else
      @task_list = TaskList.new
      @task_list.name = params[:task_list][:name]
      @task_list.save!
      flash[:notice] = "Task successfuly added"
      redirect_to "/"
    end
  end

  def edit_get
    @task_list = TaskList.find(params[:id])
    render :edit
  end

  def edit_put
    @task_list = TaskList.find(params[:id])
    @task_list.update!(name: params[:task_list][:name])
    flash[:notice] = "Task list was updated successfully"
    redirect_to "/"
  end

  def show
    @task_list = TaskList.find(params[:id])
    @task = @task_list.tasks.order(:datetime)
  end

  def delete
    @task_list = TaskList.find(params[:id])
    @task_list.destroy
    flash[:notice] = "Task List Deleted"
    redirect_to "/"
  end

end