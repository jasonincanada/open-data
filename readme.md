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

![mind map](https://raw.githubusercontent.com/jasonincanada/open-data/main/images/mind-map.png)


## xkeyscore

Xkeyscore is a system for discovering new info in relationships among disparate data sources.  Used first by real-world intelligence agencies, the rest of us can now get a feel for its power thanks to the game [NITE Team 4](https://www.niteteam4.com/), which includes an xkeyscore module for finding new info on a target.  I had a "whoa" moment sitting in front of that interface, so the goal of this project is to apply such techniques to real-world data.  The source data will be the open data sets published to Canada's [open data portal](https://open.canada.ca/en/open-data) and the goal is to find... who knows what?

The NITE Team 4 dev team did a live demo of the xkeyscore subsystem, starting at [26:39 in this video](https://www.youtube.com/watch?v=gniiAWYmKgM&t=1599s), through to 32:20.

