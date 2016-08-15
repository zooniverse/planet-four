require 'csv'
require 'json'
require 'nokogiri'
require 'open-uri'

def create_unless_exists(path)
  unless File.exists?(path)
    `mkdir -p #{ path }`
  end
end

def filename_from_uri(uri)
  File.basename(URI(uri).path)
end

raw_sources_path = '/data/raw_sources'
sources_path = '/data/sources'

create_unless_exists(raw_sources_path)
create_unless_exists(sources_path)
data = CSV.parse(IO.read("/data/files.csv")).drop(1)

cutouts = []

data.each do |datum|
  cutout = {}

  name = datum[0]
  html = Nokogiri::HTML(open("http://hirise.lpl.arizona.edu/#{ name }"))

  # I fail to see how I can make this nicer.
  geo_con = html.css('.geometry-container')
  acquisition_date = geo_con.css('table tr:nth-child(1) td:nth-child(2)').inner_html
  local_mars_time = geo_con.css('table tr:nth-child(1) td:nth-child(4)').inner_html
  latitude = geo_con.css('table tr:nth-child(2) td:nth-child(2)').inner_html.to_f
  longitude = geo_con.css('table tr:nth-child(2) td:nth-child(4)').inner_html.to_f
  range_to_target = geo_con.css('table tr:nth-child(3) td:nth-child(2)').inner_html.to_f
  original_image_scale = geo_con.css('table tr:nth-child(3) td:nth-child(4)').inner_html
  emission_angle = geo_con.css('table tr:nth-child(5) td:nth-child(2)').inner_html.to_f
  phase_angle = geo_con.css('table tr:nth-child(5) td:nth-child(4)').inner_html.to_f
  solar_incidence = geo_con.css('table tr:nth-child(6) td:nth-child(2)').inner_html.to_f
  solar_longitude = geo_con.css('table tr:nth-child(6) td:nth-child(4)').inner_html.to_f
  north_azimuth = geo_con.css('table tr:nth-child(8) td:nth-child(2)').inner_html.to_f
  south_azimuth = geo_con.css('table tr:nth-child(8) td:nth-child(4)').inner_html.to_f

  download_link = html.css('.image-details-container td:nth-child(2) a[href]').select { |link| link['href'].match(/RGB\.NOMAP/) }.first['href']

  filename = filename_from_uri(download_link)

  `curl -o #{ raw_sources_path }/#{ filename } #{ download_link }`
  `j2k_to_image -i #{ raw_sources_path }/#{ filename } -o #{ sources_path }/#{ name }.bmp`

  cutout = {
    name: name,
    acquisition_date: acquisition_date,
    local_mars_time: local_mars_time,
    latitude: latitude,
    longitude: longitude,
    range_to_target: range_to_target,
    original_image_scale: original_image_scale,
    emission_angle: emission_angle,
    phase_angle: phase_angle,
    solar_incidence: solar_incidence,
    solar_longitude: solar_longitude,
    north_azimuth: north_azimuth,
    south_azimuth: south_azimuth,
    download_link: download_link
  }

  cutouts << cutout
end

File.open("/data/sources.json", "w"){ |f| f.puts(JSON.dump(cutouts)) }
