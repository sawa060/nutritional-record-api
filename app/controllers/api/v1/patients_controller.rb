class Api::V1::PatientsController < ApplicationController
  before_action :set_patients, only: %i[show update destroy]

  def index
    patients = Patient.order(created_at: :desc)
    @total, @patients = pager(patient)
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
    render 'show', formats: :json, handlers: 'jbuilder'
  end

  def create
    @patient = Patient.new(patient_create_params)

    if @patient.save
      render 'show', formats: :json, handlers: 'jbuilder', status: :created
    else
      response422_with_error(@patient.error.details)
    end
  end

  def update
    if @patient.update(patient_update_params)
      render 'show', formats: :json, handlers: 'jbuilder'
    else
      response422_with_error(@patient.errors.details)
    end
  end

  def destroy
    if @patient.destroy
      response200
    else
      response422_with_error(@patient.errors.details)
    end
  end

  private

  def set_patients
    @patient = Patient.find(params[:id])
  end

  def patient_create_params
    params.require(:patient).permit(
      :name, :sex, :email, :phone_number, :number, :birthday
    )
  end

  def patient_update_params
    params.require(:patient).permit(
      :name, :sex, :email, :phone_number, :number, :birthday
    )
  end
end
