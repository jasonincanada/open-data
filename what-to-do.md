## Things to do

With Docker installed, copy this repo locally:

```bash
git clone https://github.com/jasonincanada/open-data.git
```

## Render a chart

Render a chart of the top 5 most encountered animals in Parks Canada lands from the [official reported data](https://open.canada.ca/data/en/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680):

```bash
cd ~/open-data/set/wildlife-incidents

# build all docker dependencies and render the chart
make chart

# spin up an nginx server to browse the trough at port 8000
make web
```

This build process should result in [this chart](set/wildlife-incidents/trough/sum-by-animal.png) sitting in your `~/open-data/set/wildlife-incidents/trough` folder

Also check out the [Dockerfile.plot](set/wildlife-incidents/Dockerfile.plot) file for the equivalent chart built using a [multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) and no leftover artifacts other than the final `sum-by-animal.png` chart and an nginx install to serve it

The same chart can be built in yet a third way with a bash script [go-trough.sh](go-trough.sh)

