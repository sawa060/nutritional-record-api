class Api::V1::BehaviorsController < ApplicationController
  before_action :set_behaviors, only: %i[show update destroy]

  def index
    behaviors = Behavior.order(created_at: :desc)
    @total, @behaviors = pager(behavior)
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
    render 'show', formats: :json, handlers: 'jbuilder'
  end

  def create
    @behavior = Behavior.new(behavior_create_params)

    if @behavior.save
      render 'show', formats: :json, handlers: 'jbuilder', status: :created
    else
      response422_with_error(@behavior.error.details)
    end
  end

  def update
    if @behavior.update(behavior_update_params)
      render 'show', formats: :json, handlers: 'jbuilder'
    else
      response422_with_error(@behavior.errors.details)
    end
  end

  def destroy
    if @behavior.destroy
      response200
    else
      response422_with_error(@behavior.errors.details)
    end
  end

  private

  def set_behaviors
    @behavior = Behavior.find(params[:id])
  end

  def behavior_create_params
    params.require(:behavior).permit(
      :patient_id, :smoking, :drinking, :exercise_habits, :breakfast, :sleeping
    )
  end

  def behavior_update_params
    params.require(:behavior).permit(
      :patient_id, :smoking, :drinking, :exercise_habits, :breakfast, :sleeping
    )
  end
end
