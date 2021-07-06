## Sample data set

**OGP Data Set:** National Air Pollution Surveillance (NAPS) Program
**OGP Home:** https://open.canada.ca/data/en/dataset/1b36a356-defd-4813-acea-47bc3abd859b

**Dimension Source:**  NAPS Station
 - **url:** [https://data-donnees.ec.gc.ca/data/air/.../StationsNAPS-StationsSNPA.csv](https://data-donnees.ec.gc.ca/data/air/monitor/national-air-pollution-surveillance-naps-program/ProgramInformation-InformationProgramme/StationsNAPS-StationsSNPA.csv)
 - **each record is a:** NAPS Monitoring Station

**Fact Source:** Air Pollutant Concentration Levels
 - **url:** [https://data-donnees.ec.gc.ca/data/air/.../2020_VOC-COV.zip](https://data-donnees.ec.gc.ca/data/air/monitor/national-air-pollution-surveillance-naps-program/Data-Donnees/2020/IntegratedData-DonneesPonctuelles/2020_VOC-COV.zip)
 - **each record is a:** measurement of concentration level of pollutant

**Example Fact Datum:**
Concentration level
 - **of:** Ethane
 - **in:** air
 - **at:** NAPS Station 10102 (WATER STREET POST OFFICE)
 - **on:** 1/10/2020
 - **measured by:** <u>GC_FID</u>  `(<-- analyst task: initiate a dimension)`
 - **was:** 2.726187 ug/m3


### Initiate A New Dimension:

*After a few moments googling for our discovered dimensional record:*

<u>GC_FID</u> -> "Gas Chromatography – Flame Ionization Detector"
 - **type:** Analytical Instrument
 - **blurb:** Gas Chromatography – Flame Ionization Detector or GC-FID is a very common analytical technique that is widely used in the petrochemical, pharmaceutical and natural gas markets.
 - **blurb_url:** [http://www.airproducts.ca/industries/Analytical-Laboratories/analytical-lab-applications/product-list/gc-with-flame-ionization-detector-gc-fid-analytical-laboratories](http://www.airproducts.ca/industries/Analytical-Laboratories/analytical-lab-applications/product-list/gc-with-flame-ionization-detector-gc-fid-analytical-laboratories.aspx?itemId=D6D6641C668A47139A6F1960D9441B93)


### Other Dimensions

Urbanization

 - LU
 - MU
 - NU - Non-Urban <1k
 - SU

Neighbourhood
 - P[1..6]

Site Type

 - NS
 - PE - General Population Exposure
 - PS
 - RB - Regional Background
 - T
