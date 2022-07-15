class PriceAlert < ApplicationMailer
	def send_price_alert_mail (user)
		mail(to: user.email, subject: "Price Alert")
	end
end