complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        # print(directory)
        # print(id)
        id = as.numeric(id)
        # print(id)
        # print(length(id))

        m = matrix(, nrow = 0, ncol = 2, dimnames = list(c(),c("id", "nobs")))
        
        # monitordata = getmonitor(id, directory)

        # applyfunction = function(id) {
        #         monitordata = getmonitor(id, directory)
        #         rbind(m,c(id, nrow(monitordata[complete.cases(monitordata),])))
        # }

        # m.applied = sapply(id, applyfunction)

        # m_almostready = t(m.applied)
        # colnames(m_almostready) = c("id", "nobs")
        # m_almostready
        
        applyfunction = function(id){
                monitordata = getmonitor(id, directory)
                nrow(monitordata[complete.cases(monitordata),])
        }

        completes = sapply(id, applyfunction)
        data.frame(id=id, nobs=completes)
        # uhu = data.frame(id, completes)
        # names(uhu) = c("id", "nobs")
        # uhu
}