require 'bson'
require 'json'
require 'uri'

def create_unless_exists(path)
  unless File.exists?(path)
    `mkdir -p #{ path }`
  end
end

def filename_from_uri(uri)
  File.basename(URI(uri).path)
end

sources_path = '/data/sources'
cutouts_path = '/data/cutouts'

create_unless_exists(sources_path)
cutouts = JSON.parse(File.read('/data/sources.json'))

subjects = []

chunk_size = {
  width: 840,
  height: 648
}

overlap_size = {
  width: 100,
  height: 100
}

cutouts.each_with_index do |cutout_hash, index|
  puts "#{index + 1} - #{cutout_hash['name']}"

  name = cutout_hash['name']

  create_unless_exists("#{ cutouts_path }/#{ name }")

  `/usr/src/app/overlapcrop -s #{ chunk_size[:width] }x#{ chunk_size[:height] } -o #{ overlap_size[:width] }x#{overlap_size[:height] } #{ sources_path }/#{ name }.bmp #{ cutouts_path }/#{ name }/#{ name }.jpg`

  lat = cutout_hash['latitude']
  lng = cutout_hash['longitude']

  Dir.glob("#{ cutouts_path }/#{ name }/*.jpg").each do |chunk|
    row, col = chunk.match(/_r(\d+)_c(\d+)/i)[1..2].collect(&:to_i)
    id = BSON::ObjectId.new.to_s
    acquisition_date = Date.parse(cutout_hash['acquisition_date']).strftime('%FT%TZ')

    `mv #{chunk} #{cutouts_path}/#{name}/#{id}.jpg`

    subject = {
      id: id,
      coords: [lat, lng],
      location: {
        standard: "https://www.planetfour.org/subjects/standard/#{ id }.jpg"
      },
      metadata: {
        acquisition_date: acquisition_date,
        emission_angle: cutout_hash['emission_angle'],
        lat_centered: lat,
        link: cutout_hash['download_link'],
        lng_east: lng,
        local_mars_time: cutout_hash['local_mars_time'],
        name: name,
        north_azimuth: cutout_hash['north_azimuth'],
        phase_angle: cutout_hash['phase_angle'],
        sub_solar_azimuth: cutout_hash['south_azimuth'],
        time: nil,
        x_tile: col,
        y_tile: row
      }
    }

    subjects << subject
  end
end

File.open("/data/manifest.json", "w"){ |f| f.puts(JSON.dump(subjects)) }
