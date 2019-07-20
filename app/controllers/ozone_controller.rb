class OzoneController < ApplicationController
  

	

  def index
  	require 'net/http'
  	require 'json'

  	@url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=60611&distance=100&API_KEY=4E37D0AF-3864-44BA-A6B1-A1E6B30324F5'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)
  	if @output.empty?
  		
  		@final_output = "Error"
  		
  	elsif !@output
  		@back_color = "bg-danger"
  		@final_output = "Error"
  		
 	else
 		@final_output = @output[0]['AQI']
 		@category_name = @output[0]['Category']['Name']
  	end
  		
  		if @final_output == "Error"
  		@api_color = "bg-default"
  	elsif @final_output <= 50
  		@api_color = "bg-success"
  		@api_description = "Good (0 - 50) Air quality is considered satisfactory, and air pollution poses little or no risk."
  	elsif @final_output >= 51 && @final_output <= 100
  		@api_color = "bg-info"
  		@api_description = "Moderate (51 - 100) Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution."
  	elsif @final_output >= 101 && @final_output <= 150
  		@api_color = "bg-warning"
  		@api_description = "Unhealthy for Sensitive Groups (101 - 150) 
Although general public is not likely to be affected at this AQI range, people with lung disease, older adults and children are at a greater risk from exposure to ozone, whereas persons with heart and lung disease, older adults and children are at greater risk from the presence of particles in the air."
  	elsif @final_output >= 151 && @final_output <= 200
  		@api_color = "bg-danger"
  		@api_description = "Unhealthy (151 - 200) 
Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects."
  	elsif @final_output >= 201 && @final_output <= 300
  		@api_color = "bg-primary"
  		@api_description = "Very Unhealthy (201 - 300)
Health alert: everyone may experience more serious health effects."
  	elsif @final_output >= 301 && @final_output <= 500
  		@api_color = "maroon"
  		@api_description = "Hazardous (301 - 500)
Health warnings of emergency conditions. The entire population is more likely to be affected."
 		
  	end

  end


  def zipcode
 require 'net/http'
  	require 'json'

  	@zip_query = params[:zipcode]
  	if params[:zipcode] ==""
  		
  	@zip_query = "hey you forgot to enter a zip code"
    elsif params[:zipcode]

  

  @url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode='+@zip_query+'&distance=100&API_KEY=4E37D0AF-3864-44BA-A6B1-A1E6B30324F5'
  @uri = URI(@url)
  @response = Net::HTTP.get(@uri)
  @out = JSON.parse(@response)
  
   if @out.empty?
        @final = "Error"
      elsif !@out
        @final = "Error"
      else
        @final = @out[0]['AQI']
        @category_name = @out[0]['Category']['Name']
      end

      if @final == "Error"
        @api = "bg-default"
      elsif @final <= 50
        @api = "bd-success"
        @api_d = "Good (0 - 50) Air quality is considered satisfactory, and air pollution poses little or no risk."
      elsif @final >= 51 && @final <= 100
        @api = "bg-warning"
        @api_d = "Moderate (51 - 100) Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution."
      elsif @final >= 101 && @final <= 150
        @api = "bg-primary"
        @api_d = "Unhealthy for Sensitive Groups (101 - 150) 
  Although general public is not likely to be affected at this AQI range, people with lung disease, older adults and children are at a greater risk from exposure to ozone, whereas persons with heart and lung disease, older adults and children are at greater risk from the presence of particles in the air."
      elsif @final >= 151 && @final <= 200
        @api = "bg-danger"
        @api_d = "Unhealthy (151 - 200) 
  Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects."
      elsif @final >= 201 && @final <= 300
        @api = "bg-info"
        @api_d = "Very Unhealthy (201 - 300)
  Health alert: everyone may experience more serious health effects."
      elsif @final >= 301 && @final <= 500
        @api = "bg-danger"
        @api_d = "Hazardous (301 - 500)
  Health warnings of emergency conditions. The entire population is more likely to be affected."
      
      end


  end
  end


end
