####Changing File names recursively within a folder which is inside a folder
###Parent directory
parentDir = "X:/Hayks_Materials/BNG/Projects/VAP_Q.S_solo_SMAPs"
###Getting all folders with the given pattern
l <- dir(parentDir , pattern = "BF*")
###looping across the directories
for (ll in seq_along(l)){
  ###Setting the working directories, based on the folder name
  setwd(file.path(parentDir, l[ll]))
  ###Getting the file name from the folder name. You can change this
  ###to add your filename
  fname <- l[ll]
  ###Listing files based on a given pattern.
  listFile <- (".", pattern = "fastq_*"))
  ###Changing the file names.
  file.rename(listFile,paste0(fname, "_", listFile))
  ###Setting working directory back to present directory
  setwd("../")
}

####Changing File names inside a folder
###Parent directory
parentDir = "X:/Hayks_Materials/BNG/Projects/VAP_Q.S_solo_SMAPs"
###Listing files based on a given pattern. In our case the word UDN,
###was in the file name
listFile <- list.files(parentDir , pattern = "*UDN*")
###Getting present working directory
gee <- getwd()
##Setting parent directory
setwd(parentDir)
###Word to add before present file name
fname <- "UDN"
###Changing the file names, the output would be UDN_<current file name>.<extension>
file.rename(listFile,paste0(fname, "_", listFile))
###
setwd(gee)
