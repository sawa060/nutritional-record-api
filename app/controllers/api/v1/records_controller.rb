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

  end

  def update

  end

  def destroy

  end

  private

  def set_record
    @record = Record.find(params[:id])
  end
end
