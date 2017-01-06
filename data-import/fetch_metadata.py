# Based on https://gist.github.com/michaelaye/702fff89930de42822d26e14fb182160

import csv
import os
import requests

from planetpy import pdstools as pds

def download_file(url, path):
    with open(path, 'wb') as out_f:
        response = requests.get(url, stream=True)
        response.raise_for_status()
        for block in response.iter_content(1024):
            out_f.write(block)

LABEL_PATH = os.path.join('/', 'data', 'RDRCUMINDEX.LBL')
LABEL_URL = 'http://hirise-pds.lpl.arizona.edu/PDS/INDEX/RDRCUMINDEX.LBL'

TABLE_URL = 'http://hirise-pds.lpl.arizona.edu/PDS/INDEX/RDRCUMINDEX.TAB'
TABLE_PATH = os.path.join('/', 'data', 'RDRCUMINDEX.TAB')

download_file(LABEL_URL, LABEL_PATH)
download_file(TABLE_URL, TABLE_PATH)

label = pds.IndexLabel(LABEL_PATH)
df = label.read_index_data()

with open(os.path.join('/', 'data', 'files.csv')) as files_f:
    files_r = csv.reader(files_f)
    list_of_image_names = [ row[0] for row in files_r ]

df.set_index('OBSERVATION_ID', inplace=True)

data = df.loc[list_of_image_names]
# second line for the fact that lots/all metadata exists for _RED and _COLOR
# channels
data = data[data.PRODUCT_ID.str.endswith('_COLOR')]

# don't really have a center lat/lon in this index, so calculating a rough avg
# value
data['MEAN_LATITUDE'] = (data.MAXIMUM_LATITUDE + data.MINIMUM_LATITUDE) / 2
data['MEAN_LONGITUDE'] = (data.MAXIMUM_LONGITUDE + data.MINIMUM_LONGITUDE) / 2

translator = {
        'acquisition_date': 'START_TIME',
        'local_mars_time': 'LOCAL_TIME',
        'latitude': 'MEAN_LATITUDE',
        'longitude': 'MEAN_LONGITUDE',
        'range_to_target': 'TARGET_CENTER_DISTANCE',
        'original_image_scale': 'MAP_SCALE',
        'emission_angle': 'EMISSION_ANGLE',
        'phase_angle': 'PHASE_ANGLE',
        'solar_incidence': 'INCIDENCE_ANGLE',
        'solar_longitude': 'SOLAR_LONGITUDE',
        'north_azimuth': 'NORTH_AZIMUTH',
        'south_azimuth': 'SUB_SOLAR_AZIMUTH',
}

output = data[list(translator.values())]
output.to_csv(os.path.join('/', 'data', 'metadata.csv'))
