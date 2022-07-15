class PriceWorker
	include Sidekiq::Worker
  sidekiq_options(retry: false)

  def perform
  	price = PriceDetectorsController.new.current_price()
  	user_alerts = UserAlert.where(status: "created")
  	user_alerts.each do |alert|
  		if alert.price == price
  			PriceAlert.send_price_alert_mail(alert.user).deliver_now
  			alert.update(status:"triggered")
  		end
  	end
  end
end