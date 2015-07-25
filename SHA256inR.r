# -- -------------------------------------------------------------------------------------------- #
# -- Initial Developer: IF.Francisco.ME --------------------------------------------------------- #
# -- sha256 Message content POST ---------------------------------------------------------------- #
# -- License: GNU License V3 -------------------------------------------------------------------- #
# -- Post Web Page -- http://bit.ly/SHA256withR ------------------------------------------------- #
# -- -------------------------------------------------------------------------------------------- #

if (!require(digest)) install.packages('digest', quiet = TRUE)
suppressMessages(library (digest))     # SHA-256 Encoding for POST requests

if (!require(httr)) install.packages('httr', quiet = TRUE)
suppressMessages(library (httr))       # meXBTMktsleer url's

if (!require(jsonlite)) install.packages('jsonlite', quiet = TRUE)
suppressMessages(library (jsonlite))   # JSON parser

if (!require(RCurl)) install.packages('RCurl', quiet = TRUE)
suppressMessages(library (RCurl))      # leer url's

UserID <- "franciscome@mexbt.com"
APIKey <- "123456789abcdefg789hijklmnopqrst" # Both are examples
PvtKey <- "tsrqponmlkjih987gfedcba987654321" # Place yours here

APInonce   <- trunc(as.numeric(Sys.time()), "miliseconds")
PreMessage <- paste(get("APInonce"),UserID,sep="")
Message    <- paste(PreMessage,APIKey,sep="")
APIMessage <- paste(paste(get("APInonce"),UserID,sep=""),APIKey,sep="")

APISig <- toupper(hmac(object = APIMessage, key=PvtKey,algo="sha256",serialize=FALSE))
