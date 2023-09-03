class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all.order(:name)
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def new
    @creature = Creature.new
  end

  def create
    @creature = Creature.new(creature_params)

    if @creature.save
      redirect_to @creature
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @creature = Creature.find(params[:id])
  end

  def update
    @creature = Creature.find(params[:id])

    if @creature.update(creature_params)
      redirect_to @creature
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @creature = Creature.find(params[:id])
    @creature.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :kind, :description)
  end
end
