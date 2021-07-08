
# start with our custom-designed .csv-processing image (alpine + xsv)
FROM xsv:latest

WORKDIR /data

# download some files from the Open Data Portal
#
# data dictionary
ADD https://open.canada.ca/data/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680/resource/278d8173-8c2d-4366-afc2-0b3626e7ec8a/download/pca-national-human-wildlife-coexistence-data-dictionary.csv /data/dictionary.csv

# header descriptions
ADD https://open.canada.ca/data/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680/resource/7f1ce4da-f174-4394-a53d-398b30c0f69d/download/pca_national_human_wildlife_conflict_2019_heading_descriptions.csv /data/headers.csv

# detailed records
ADD https://open.canada.ca/data/dataset/743a0b4a-9e33-4b12-981a-9f9fd3dd1680/resource/eaadb900-e1e5-4844-9617-4b8d76f0ea80/download/pca-human-wildlife-coexistence-incidents-detailed-records.csv /data/detailed.csv

