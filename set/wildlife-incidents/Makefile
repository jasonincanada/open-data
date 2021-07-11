#
#  this Makefile produces the same chart as Dockerfile.plot and go-trough.sh
#
#  build the main chart with:  make chart
#  launch a web server with:   make web
#
#  pre-reqs:
#
#    ~/open-data/q$ docker build -t q:latest .
# 

# details of all human/wildlife interactions involving animals
resource = https://open.canada.ca/data/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680/resource/d6892a77-5e2f-407e-80ee-3b76466a4d80/download/pca-human-wildlife-coexistence-animals-involved-detailed-records.csv
file     = animals.csv


chart: trough/sum-by-animal.png


trough/sum-by-animal.png: trough/sum-by-animal.csv sum-by-animal.gnuplot

	# copy our gnuplot script into the trough
	cp sum-by-animal.gnuplot trough/

	# run someone's alpine+gnuplot image on the result of the SQL query
	docker run --rm -v "$(PWD)/trough":/work remuslazar/gnuplot \
		sum-by-animal.gnuplot

	rm trough/sum-by-animal.gnuplot


trough/sum-by-animal.csv: trough/$(file) sum-by-animal.sql

	# copy our sql query into the trough
	cp sum-by-animal.sql trough/

	# run the q container with our SQL query on the local .csv
	docker run --rm -v "$(PWD)/trough":/data q:latest \
		q --delimiter=,																	\
			--skip-header --output-header									\
			 -e iso-8859-1																\
			 -q sum-by-animal.sql > trough/sum-by-animal.csv

	# echo our results to screen
	cat trough/sum-by-animal.csv

	rm trough/sum-by-animal.sql


trough/$(file):
	
	# download resource locally and rename it to something shorter
	wget -O trough/$(file) $(resource)


# load an nginx container on port 8000 to browse the trough
web:
	docker run --rm -v "$(PWD)/trough":/usr/share/nginx/html -p 8000:80 nginx:latest

