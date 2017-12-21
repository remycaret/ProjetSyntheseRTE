for(i in 1:3) {
  name <- paste("LoadR", i, "RT", sep="")
  file_name <- paste("LoadR", i, "RT.csv", sep="")
  path_name <- paste("~/Projet de synthèse/Input files/RT/Load/", file_name, sep="")
  assign(name, read.csv(path_name))
  }
for(i in 1:75) {
  name <- paste("Solar", i, "RT", sep="")
  file_name <- paste("Solar", i, "RT.csv", sep="")
  path_name <- paste("~/Projet de synthèse/Input files/RT/Solar/", file_name, sep="")
  assign(name, read.csv(path_name))
  }
for(i in 1:17) {
  name <- paste("Wind", i, "RT", sep="")
  file_name <- paste("Wind", i, "RT.csv", sep="")
  path_name <- paste("~/Projet de synthèse/Input files/RT/Wind/", file_name, sep="")
  assign(name, read.csv(path_name))
  }
for(i in 16:43) {
  name <- paste("Hydro", i, sep=" ")
  file_name <- paste(name, ".csv", sep="")
  path_name <- paste("~/Projet de synthèse/Input files/Hydro/", file_name, sep="")
  assign(name, read.csv(path_name))
}

LoadTot <- Load1RT;
for(i in 2:3)
   {
         for (j in 1:8784) 
           {
           LoadTot[j,2]= LoadTot[j,2] + get(paste("LoadR", i, "RT", sep=""))[j,2]
           }
}

SolarTot <- Solar1RT;
for(i in 2:75)
   {
         for (j in 1:8784) 
           {
                 SolarTot[j,2]= SolarTot[j,2] + get(paste("Solar", i, "RT", sep=""))[j,2]
             }
}

WindTot <- Wind1RT;
for(i in 2:17)
   {
         for (j in 1:8784) 
           {
                 WindTot[j,2]= WindTot[j,2] + get(paste("Wind", i, "RT", sep=""))[j,2]
             }
}

AllTot <- LoadTot
AllTot[,2] <- AllTot[,2] + SolarTot[,2]
AllTot[,2] <- AllTot[,2] + WindTot[,2]
