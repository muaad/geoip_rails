require "geoip_rails/version"
require "httparty"

module GeoipRails
  module_function

  def find_by_ip ip
    HTTParty.get("http://freegeoip.net/json/#{ip}")
  end
  
  def find_by_ip_and_format ip, format
    `wget "http://freegeoip.net/#{format}/#{ip}"`
    response = ""
    File.open("#{ip}").each { |line|  response += line}
    return response
    `rm -rf #{ip}`
  end

  def geolocate ip
  	HTTParty.get("http://freegeoip.net/json/#{ip}")
  end

  # def geolocation
  # 	ip = request.remote_ip
  # 	HTTParty.get("http://freegeoip.net/json/#{ip}")
  # end

  def country ip
  	find_by_ip(ip)["country_name"]
  end

  def country_code ip
  	find_by_ip(ip)["country_code"]
  end

  def city ip
  	find_by_ip(ip)["city"]
  end

  def region_code ip
  	find_by_ip(ip)["region_code"]
  end

  def region_name ip
  	find_by_ip(ip)["region_name"]
  end

  def zipcode ip
  	find_by_ip(ip)["zipcode"]
  end

  def latitude ip
  	find_by_ip(ip)["latitude"]
  end

  def longitude ip
  	find_by_ip(ip)["longitude"]
  end

  def metro_code ip
  	find_by_ip(ip)["metro_code"]
  end

  def area_code ip
  	find_by_ip(ip)["area_code"]
  end
end
