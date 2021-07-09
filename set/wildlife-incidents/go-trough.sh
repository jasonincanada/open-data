#!/bin/bash
#
#  this script produces the exact same chart as Dockerfile.plot but using
#  the docker command-line utility only, not a multi-stage build
#
#  pre-reqs:
#
#    ~/open-data/q$ docker build -t q:latest .
# 

# details of all human/wildlife interactions involving animals
RESOURCE=https://open.canada.ca/data/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680/resource/d6892a77-5e2f-407e-80ee-3b76466a4d80/download/pca-human-wildlife-coexistence-animals-involved-detailed-records.csv
FILE=animals.csv

# download resource locally if it's not already here
wget --no-clobber -O trough/$FILE $RESOURCE

# copy our sql query into the trough
cp sum-by-animal.sql trough/

# run the q container with our SQL query on the local .csv
docker run --rm -v "$PWD/trough":/data q:latest \
  q --delimiter=,                               \
    --skip-header --output-header               \
     -e iso-8859-1                              \
     -q sum-by-animal.sql > trough/sum-by-animal.csv


# copy our gnuplot script
cp sum-by-animal.gnuplot trough/

# run someone's alpine+gnuplot image on the result of the SQL query
docker run --rm -v "$PWD/trough":/work remuslazar/gnuplot \
  sum-by-animal.gnuplot


# the chart is rendered on our host locally at ./trough/sum-by-animal.png
#
# launch an nginx container on port 8000 to view it in a browser (or just
# uncomment the next line and it'll launch again every time you run this)
#
#    docker run --rm -v "$PWD/trough":/usr/share/nginx/html -p 8000:80 nginx:latest

# url should be something like:  http://192.168.0.16:8000/sum-by-animal.png
#
# we'll leave the artifacts in ./trough/ but we'll delete the files we had to
# duplicate to bring them into view of the containers

rm trough/sum-by-animal.sql
rm trough/sum-by-animal.gnuplot

