
# start with our custom-designed .csv-querying image (ubuntu + q)
FROM q:latest

# download details of all incidents involving animals
RUN wget -O /data/animals.csv https://open.canada.ca/data/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680/resource/d6892a77-5e2f-407e-80ee-3b76466a4d80/download/pca-human-wildlife-coexistence-animals-involved-detailed-records.csv

# copy our sql query into the container
COPY sum-by-animal.sql .

# always run q with these params
ENTRYPOINT ["q", "--delimiter=,", "--skip-header", "-e iso-8859-1", "--output-header" ]

# the rest of the command defaults to this but can be overridden on the command line
CMD ["-q", "sum-by-animal.sql"]


#  ~/open-data/set/wildlife-incidents$ docker build -f Dockerfile.q -t query:animals .
#
#  ~/open-data/set/wildlife-incidents$ docker run --rm query:animals
#  Species,Total
#  Elk,63906
#  Black Bear,11915
#  Grizzly Bear,5356
#  Western Toad,4021
#  Plains Bison,3248
#  Bighorn Sheep,2556
#  Wolf,1103
#  Mule Deer,832
#  Moose,755
#  Wasp,734
#
#  ~/open-data/set/wildlife-incidents$ docker run --rm query:animals 'SELECT SUM("Sum of Number of Animals") AS Total FROM animals.csv'
#  Total
#  103346

