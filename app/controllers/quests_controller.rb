class QuestsController < ApplicationController
  before_action :set_quest, only: %i[show edit update destroy ]
  def index
    @quests = @user.quests.where(completed: false).order(created_at: :desc)
  end

  def show
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)

    if @quest.save
      redirect_to quest_path(@quest), notice: "New quest added to your adventure log!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quest.update(quest_params)
      redirect_to quest_path(@quest), notice: "Quest details updated! The adventure continues..."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quest.destroy!
    redirect_to root_path, notice: "Quest abandoned! Perhaps another time brave knight..."
  end

  private
  def set_quest
    @quest = @user.quests.find(params[:id])
  end

  def quest_params
    params.expect(:quest, %i[name description completed reward_points])
  end
end
