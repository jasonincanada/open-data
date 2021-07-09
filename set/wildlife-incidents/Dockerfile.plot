# three-stage build to:
#
#   1) pull a .csv from the Canada portal and run a SQL query on it
#   2) plot the resulting data using gnuplot
#   3) copy the resulting graph to an nginx container for viewing in a web browser
#

# start with our custom-designed .csv-querying image (ubuntu + q)
FROM q:latest AS csv

# download details of all human/wildlife interactions involving animals
RUN wget -O /data/animals.csv https://open.canada.ca/data/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680/resource/d6892a77-5e2f-407e-80ee-3b76466a4d80/download/pca-human-wildlife-coexistence-animals-involved-detailed-records.csv

# copy our sql query into the container
COPY sum-by-animal.sql .

RUN q --delimiter=, --skip-header -e iso-8859-1 --output-header -q sum-by-animal.sql > /data/sum-by-animal.csv


# start again with someone's alpine+gnuplot image
FROM remuslazar/gnuplot AS plot

# copy our gnuplot script
COPY sum-by-animal.gnuplot /work

# retrieve the results of our SQL query from the previous container
COPY --from=csv /data/sum-by-animal.csv /work

RUN gnuplot sum-by-animal.gnuplot


# start again with an nginx image for rendering our image locally
FROM nginx:latest

COPY --from=plot /work/sum-by-animal.png /usr/share/nginx/html


#
# copy the .png file out of the nginx container to check it in
#
#   ~/open-data/set/wildlife-incidents$ docker run --rm -v "$PWD":/out web:animals cp /usr/share/nginx/html/sum-by-animal.png /out
#

