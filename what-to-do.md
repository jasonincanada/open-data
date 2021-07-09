## Things to do

With Docker installed, copy this repo locally:

```bash
git clone https://github.com/jasonincanada/open-data.git
```

Build the pre-requisite images:

```bash
# build the xsv image for arbitrary .csv file processing
cd ~/open-data/xsv
docker build -t xsv:latest .

# build the q image for running SQL queries on .csv files
cd ~/open-data/q
docker build -t q:latest .
```

Check Docker's image list for our newly-built images:

```bash
~/open-data/q$ docker image ls
REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
xsv                  latest    a63074447a85   15 seconds ago   34.7MB
q                    latest    83574645bd1c   3 hours ago      131MB
```

## Render a chart

Render a chart of the top 5 most encountered animals in Parks Canada lands from the [official reported data](https://open.canada.ca/data/en/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680):

```bash
cd ~/open-data/set/wildlife-incidents

./go-trough.sh
```

This script [go-trough.sh](set/wildlife-incidents/go-trough.sh) should result in [this chart](set/wildlife-incidents/trough/sum-by-animal.png) sitting in your `~/open-data/set/wildlife-incidents/trough` folder

Also check out the [Dockerfile.plot](set/wildlife-incidents/Dockerfile.plot) file for the equivalent chart built using a [multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) and no leftover artifacts other than the final `sum-by-animal.png` chart and an nginx install to serve it

