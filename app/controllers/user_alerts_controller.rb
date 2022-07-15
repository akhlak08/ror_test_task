class UserAlertsController < ApplicationController
  before_action :authenticate_user!

  # GET   /alerts
  def index
    alerts = current_user.user_alerts.paginate(:per_page => 25, :page => params[:page])
    if alerts.present?
      render json: {
        status: {code: 200, message: 'fetch all alerts'},
        data: alerts
      }
    else
      render json: {
        status: {message: "No result"}
      }, status: :unprocessable_entity
    end
  end

  # POST  /alert/create
  def create
    params[:alerts][:user_id] = current_user.id
    alerts = UserAlert.new(alerts_params)
    if alerts.save
      render json: {
        status: {code: 200, message: 'Alert created'},
        data: alerts
      }
    else
      render json: {
        status: {message: "#{alerts.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

  # DELETE /alert/destroy
  def destroy
    alert = UserAlert.find params[:id]
    if alert.present?
      alert.update(status: "deleted")
      render json: {
        status: {code: 200, message: 'Alert Deleted'},
        data: alerts
      }
    else
      render json: {
        status: {message: "#{alerts.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
     end
  end

  private
  def alerts_params
    params.require(:alerts).permit(:price, :user_id)
  end
end
