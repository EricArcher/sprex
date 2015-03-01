rm(list = ls())

osa.second.growth <- cbind(i = c(1,2,3,4,5,6,7,8,9,10,11,12,14,17,19,20,21,24,26,40,57,60,64,71,77),
                                fi = c(70,17,4,5,5,5,5,3,1,2,3,2,2,1,2,3,1,1,1,1,2,1,1,1,1))

osa.old.growth <- cbind(i = c(1,2,3,4,5,6,7,8,14,42),
                             fi = c(84,10,4,3,5,1,2,1,1,1))

lep.old.growth <- cbind(i = c(1,2,3,4,5,6,7,8,9,10,11,13,15,16,18,19,20,25,38,39,40,46,52,55),
                             fi = c(46,30,16,12,6,5,3,4,5,4,1,3,1,1,1,1,4,3,1,1,1,1,1,1))

lep.second.growth <- cbind(i = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,20,22,39,45,57,72,88,132,133,178),
                                fi = c(33,15,13,4,5,3,3,1,2,1,4,2,2,1,2,1,1,1,1,1,1,1,1,2,1,1,1))

lindero.sur.second.growth <- cbind(i = c(1,2,3,4,5,7,8,10,11,12,13,15,31,33,34,35,66,72,78,127,131,174),
                                        fi = c(29,13,5,2,3,4,1,2,2,1,2,2,1,1,1,1,1,1,1,1,1,1))

save(osa.second.growth, file = "richness/data/osa.second.growth.rdata")
save(osa.old.growth, file = "richness/data/osa.old.growth.rdata")
save(lep.old.growth, file = "richness/data/lep.old.growth.rdata")
save(lep.second.growth, file = "richness/data/lep.second.growth.rdata")
save(lindero.sur.second.growth, file = "richness/data/lindero.sur.second.growth.rdata")
