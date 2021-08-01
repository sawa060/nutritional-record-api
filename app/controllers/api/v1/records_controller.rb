class Api::V1::RecordsController < ApplicationController
  before_action :set_record, only: %i[show update destroy]

  def index
    records = Record.order(updated_at: :desc)
    @total, @records = pager(records)
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
    render 'show', formats: :json, handlers: 'jbuilder'
  end

  def create
    @record = Record.new(record_create_params)

    if @record.save
      render 'show', formats: :json, handlers: 'jbuilder', status: :created
    else
      response422_with_error(@record.errors.details)
    end
  end

  def update
    if  @record.update(record_update_params)
      render 'show', formats: :json, handlers: 'jbuilder'
    else
      response422_with_error(@record.errors.details)
    end
  end

  def destroy
    if @record.destroy
      response200
    else
      response422_with_error(@record.errors.details)
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_create_params
    params.require(:record).permit(
      :user_id, :patient_id, :subjective, :objective, :assessment, :plan, :note
    )
  end

  def record_update_params
    params.require(:record).permit(
      :user_id, :patient_id, :subjective, :objective, :assessment, :plan, :note
    )
  end
end
