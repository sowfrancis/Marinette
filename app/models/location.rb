class Location < ActiveRecord::Base

	geocoded_by :address   
	after_validation :geocode          

	def suntime
		forecast = ForecastIO.forecast(self.latitude,self.longitude)
		forecast.currently.summary
	end

	def raintime
		forecast = ForecastIO.forecast(self.latitude, self.longitude)
		forecast.currently.humidity
	end

	def temperature
		forecast = ForecastIO.forecast(self.latitude, self.longitude)
		((forecast.currently.temperature  - 32) * 5/9).round
	end

	def windspeed
		forecast = ForecastIO.forecast(self.latitude, self.longitude)
		forecast.currently.windSpeed
	end

	def cloud
		forecast = ForecastIO.forecast(self.latitude, self.longitude)
		forecast.currently.cloudCover
	end
	
end
