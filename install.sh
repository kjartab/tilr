
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# install prerequisites

sudo apt-get -y install git

sudo apt-get -y install postgresql postgresql-contrib postgis postgresql-9.3-postgis-2.1

sudo apt-get -y install osm2pgsql

sudo pg_createcluster 9.3 main --start


# install 
git clone https://github.com/mapzen/vector-datasource.git

# get the data
wget https://s3.amazonaws.com/metro-extracts.mapzen.com/new-york_new-york.osm.pbf



osm2pgsql -s -C 1024 -S vector-datasource/osm2pgsql.style -k path/to/pbf -d osm -H localhost

sudo apt-get install build-essential autoconf libtool pkg-config
# dev packages for python and dependencies
sudo apt-get install python-dev python-virtualenv libgeos-dev libpq-dev python-pip python-pil libmapnik2.2 libmapnik-dev mapnik-utils python-mapnik
