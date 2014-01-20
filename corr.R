corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        completes = complete(directory)

        valid_completes = completes$nobs > threshold
        # print(valid_completes)
        calc_cor = function(id){
        	monitordata = getmonitor(id, directory)
        	# print("Nitrate:")
        	# print(monitordata$nitrate)
        	# print("Sulfate:")
        	# print(monitordata$sulfate)
        	#correlation = cor(monitordata$nitrate, monitordata$sulfate, use="na.or.complete")
        	#print(paste(id, correlation))
        	#correlation
        	cor(monitordata$nitrate, monitordata$sulfate, use="na.or.complete")
        }
        # print("Id's of valid completes")
        # print(completes[valid_completes,]$id)
        sapply(completes[valid_completes,]$id, calc_cor)
}