
# PROBLEMS HERE!! Issues with SSH-ing in and the locale given...    Need to do this on the computer that runs vagrant

# https://github.com/mapzen/vector-datasource/wiki/Mapzen-Vector-Tile-Service


# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

# install prerequisites

sudo apt-get update

sudo apt-get -y install git

sudo apt-get -y install postgresql postgresql-contrib postgis postgresql-9.3-postgis-2.1

sudo apt-get -y install osm2pgsql

#sudo pg_createcluster 9.3 main --start


# install 
git clone https://github.com/mapzen/vector-datasource.git

# get the data
wget https://s3.amazonaws.com/metro-extracts.mapzen.com/new-york_new-york.osm.pbf

sudo -u postgres psql

create database osm;
\c osm;
create extension postgis;
\q;




osm2pgsql -s -C 1024 -S vector-datasource/osm2pgsql.style -k new-york_new-york.osm.pbf -d osm -H localhost -U postgres --password

sudo apt-get install -y build-essential autoconf libtool pkg-config

sudo apt-get install -y python-dateutil

# dev packages for python and dependencies
sudo apt-get install -y python-dev python-virtualenv unzip libgeos-dev libpq-dev python-pip python-pil libmapnik2.2 libmapnik-dev mapnik-utils python-mapnik

    

virtualenv venv
source venv/bin/activate

git clone https://github.com/mapzen/tileserver.git



# UNZIP ALL THE DATA
# AND THEN LOAD ADDITIONAL DATA
export PGPASSWORD=postgres
./add-external-data.sh -d osm -U postgres
./shp2pgsql.sh | psql -d osm -U postgres
./perform-sql-updates.sh -d osm -U postgres






# PROBLEMS HERE!!
pip install -U -r tileserver/requirements.txt
python tileserver/setup.py develop

cd tileserver
cp config.yaml.sample config.yaml
# update configuration as necessary
# #### edit config.yaml


