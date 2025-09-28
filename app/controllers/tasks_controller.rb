class TasksController < ApplicationController
  before_action :set_quest_and_task, only: %i[update, destroy]
  def create
    @quest = @user.quests.find(params[:quest_id])
    @task = @quest.tasks.build(task_params)

    if @task.save
      redirect_to @quest, notice: "Task added to your quest!"
    else
      redirect_to @quest, alert: "Failed to add task. Try again brave knight!"
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @quest, notice: @task.completed? ? "Task completed! Your knight advances forward!" : "Task updated!"
    else
      redirect_to @quest, alert: "Task update failed. Try again!"
    end
  end

  def destroy
    @task.destroy!
    redirect_to @quest, notice: "Task removed from your quest!"
  end

  private
  def set_quest_and_task
    @quest = @user.quests.find(params[:quest_id])
    @task = @quest.tasks.find(params[:id])
  end
  def task_params
    params.expect(:task, %i[title description completed])
  end
end
