class Api::V1::ResultsController < ApplicationController
  before_action :set_result, only: %i[show update destroy]

  def index
    results = Result.order(updated_at: :desc)
    @total, @results = pager(results)
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
    render 'show', formats: :json, handlers: 'jbuilder'
  end

  def create
    @result = Result.new(result_create_params)

    if @result.save
      render 'show', formats: :json, handlers: 'jbuilder', status: :created
    else
      response422_with_error(@result.errors.details)
    end
  end

  def update
    if  @result.update(result_update_params)
      render 'show', formats: :json, handlers: 'jbuilder'
    else
      response422_with_error(@result.errors.details)
    end
  end

  def destroy
    if @result.destroy
      response200
    else
      response422_with_error(@result.errors.details)
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def result_create_params
    params.require(:result).permit(
      :patient_id, :height, :body_weight, :systolic_blood_pressure, :diastolic_blood_pressure, :abdominal_circumference, :fat_percentage, :wbc, :rbc, :hb, :haematocrit, :t_cho, :hdl_cho, :ldl_cho, :tg, :ast, :alt, :gamma_gtp, :alp, :t_bil, :bun, :creatinine, :ua, :bs, :hba1c, :e_gfr, :tp, :lap, :che, :serum_amylase, :fe, :hcv, :cea, :crp, :mcv, :mch, :mchc, :note
    )
  end

  def result_update_params
    params.require(:result).permit(
      :patient_id, :height, :body_weight, :systolic_blood_pressure, :diastolic_blood_pressure, :abdominal_circumference, :fat_percentage, :wbc, :rbc, :hb, :haematocrit, :t_cho, :hdl_cho, :ldl_cho, :tg, :ast, :alt, :gamma_gtp, :alp, :t_bil, :bun, :creatinine, :ua, :bs, :hba1c, :e_gfr, :tp, :lap, :che, :serum_amylase, :fe, :hcv, :cea, :crp, :mcv, :mch, :mchc, :note
    )
  end
end
