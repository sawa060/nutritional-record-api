module Api
  module V1
    class PatientsController < ApplicationController
      def index
        patients = Patient.order(created_at: :desc)

        render json: {
          status: 200,
          message: 'OK',
          index: patients.as_json
        }
      end

      def show
        patients = Patients.find(params[:id])

        render json: {
          status: 200,
          message: 'OK',
          index: patients.as_json
        }
      end

      def create

      end

      def update

      end

      def destroy

      end

      def set_patients
        @patient =
      end
    end
  end
end
