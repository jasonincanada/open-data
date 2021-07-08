# build an xsv container for processing .csv files

FROM alpine:3.14

RUN apk add --no-cache wget

WORKDIR /xsv

# download the xsv binary
RUN wget https://github.com/BurntSushi/xsv/releases/download/0.13.0/xsv-0.13.0-x86_64-unknown-linux-musl.tar.gz

# extract the binary and remove the download
RUN tar zxvf xsv-0.13.0-x86_64-unknown-linux-musl.tar.gz
RUN rm       xsv-0.13.0-x86_64-unknown-linux-musl.tar.gz

# move the xsv binary into the PATH
RUN mv xsv /bin


#   ~/open-data/xsv$ docker build -t xsv:latest .
#   ~/open-data/xsv$ docker run --rm xsv:latest xsv
#
#
#   xsv is a suite of CSV command line utilities.
#  
#   Please choose one of the following commands:
#       cat         Concatenate by row or column
#       count       Count records
#       fixlengths  Makes all records have same length
#       flatten     Show one field per line
#       fmt         Format CSV output (change field delimiter)
#       frequency   Show frequency tables
#       headers     Show header names
#       help        Show this usage message.
#       index       Create CSV index for faster access
#       input       Read CSV data with special quoting rules
#       join        Join CSV files
#       sample      Randomly sample CSV data
#       search      Search CSV data with regexes
#       select      Select columns from CSV
#       slice       Slice records from CSV
#       sort        Sort CSV data
#       split       Split CSV data into many files
#       stats       Compute basic statistics
#       table       Align CSV data into columns
 
