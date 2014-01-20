getmonitor <- function(id, directory, summarize = FALSE) {
    ## 'id' is a vector of length 1 indicating the monitor ID
    ## number. The user can specify 'id' as either an integer, a
    ## character, or a numeric.
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'summarize' is a logical indicating whether a summary of
    ## the data should be printed to the console; the default is
    ## FALSE
	# print(id)
	# print(directory)
	# print(summarize)
	id_int = as.numeric(id)

	# print(id_int)

	if(id_int < 10){
		monitordata = read.csv(paste0(directory, "/", 0, 0, id_int, ".csv"))
	}else if (id_int < 100){
		monitordata = read.csv(paste0(directory, "/", 0, id_int, ".csv"))
	}else{
		monitordata = read.csv(paste0(directory, "/", id_int, ".csv"))
	}
	if(summarize == TRUE){
		print(summary(monitordata))
		monitordata
	} else {
		monitordata
	}
}