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

cutouts = []

CSV.foreach("/data/metadata.csv", headers: true) do |datum|
  cutout = {}

  html = Nokogiri::HTML(open("https://hirise.lpl.arizona.edu/#{ datum['OBSERVATION_ID'] }"))
  download_link = html.css('.image-details-container td:nth-child(2) a[href]').select { |link| link['href'].match(/RGB\.NOMAP\.JP2/) }.first['href']
  filename = filename_from_uri(download_link)

  `curl -L -o #{ raw_sources_path }/#{ filename } #{ download_link }`
  `j2k_to_image -i #{ raw_sources_path }/#{ filename } -o #{ sources_path }/#{ datum['OBSERVATION_ID'] }.bmp`

  cutout = {
    name: datum['OBSERVATION_ID'],
    acquisition_date: datum['START_TIME'],
    local_mars_time: datum['LOCAL_TIME'],
    latitude: datum['MEAN_LATITUDE'],
    longitude: datum['MEAN_LONGITUDE'],
    range_to_target: datum['GET_CENTER_DISTANCE'],
    original_image_scale: datum['MAP_SCALE'],
    emission_angle: datum['EMISSION_ANGLE'],
    phase_angle: datum['PHASE_ANGLE'],
    solar_incidence: datum['INCIDENCE_ANGLE'],
    solar_longitude: datum['SOLAR_LONGITUDE'],
    north_azimuth: datum['NORTH_AZIMUTH'],
    south_azimuth: datum['SUB_SOLAR_AZIMUTH'],
    download_link: download_link
  }

  cutouts << cutout
end

File.open("/data/sources.json", "w"){ |f| f.puts(JSON.dump(cutouts)) }
