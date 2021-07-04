# open-data

This project explores the open data sets at https://open.canada.ca/en/open-data, rendering charts and looking for new relationships across data sets

## Road map

- [ ] Plot a data set
	- [ ] Find something to plot
	- [ ] Multi-stage docker builds
		- [ ] pull `.csv` file from open.canada.ca
		- [ ] arbitrary SQL processing with [q](http://harelba.github.io/q/)
		- [ ] render a graph with [gnuplot](http://www.gnuplot.info/)
		- [ ] copy to nginx image for local rendering as web page
	- [ ] Haskell DSL and monad that describe the above
		- [ ] generates `Dockerfile` with multi-stage build
- [ ] Find hidden information
	- [ ] use xkeyscore techniques to extend known object properties
	- [ ] find at least one new relationship or property
	- [ ] render with above build process
- [ ] Parsers
	- [ ] write per-column parsers as needed
	- [ ] run all parsers on data set Y and report best matches


## Mind map

![mind map](images/mind-map.png)

