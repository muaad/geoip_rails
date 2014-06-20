require "geoip_rails/version"
require "httparty"

module GeoipRails
  module_function

  def find_by_ip ip
    HTTParty.get("http://freegeoip.net/json/#{ip}")
  end
  
  def find_by_ip_and_format ip, format
    ip = ip.downcase
    format = format.downcase
    `wget "http://freegeoip.net/#{format}/#{ip}"`
    response = ""
    File.open("#{ip}").each { |line|  response += line}#.gsub("\n", " ")
    `rm -rf #{ip}`
    return response
  end

  # def print ip, format
  #   puts find_by_ip_and_format ip, format
  # end

  def geolocate(*args)
    supported_formats = ["json", "xml", "csv"]
  	if args.length == 1
      find_by_ip(args[0])
    else
      format = args[1].strip.downcase
      format = "json" if !supported_formats.include?(format)
      find_by_ip_and_format(args[0], format)
    end
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
