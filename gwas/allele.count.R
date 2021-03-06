library(data.table)
library(stringr)

# allele count files: AF.BC.raw AF.raw BC.raw CB.raw AC.raw N_S.remove.raw
setwd("~/admixture_mapping/variants/gwas")

###############################################
#### parent pops not included

######## BC ############
bc <- (fread("~/admixture_mapping/variants/gwas/BC.raw"))
bc.1 <- as.data.frame(bc)
bc.2 <- t(bc.1[,7:ncol(bc)])
colnames(bc.2) <- bc.1$FID
bc.3 <-cbind(data.frame(snpname=row.names(bc.2), a1=rep(0,nrow(bc.2)), a2=rep(1, nrow(bc.2))), bc.2)
bc.3$snpname <- gsub("_[A-Z]", "", bc.3$snpname)
bc.3$snpname <- gsub("_[0-9]", "", bc.3$snpname)

#write bimbam file
write.table(bc.3, "bc.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
bc.snp.annot <- data.frame(snp.id=bc.3$snpname, pos=str_split_fixed(bc.3$snpname, ":", 2)[,2], chr=str_split_fixed(bc.3$snpname, ":", 2)[,1] )
write.table(bc.snp.annot, "bc.snp.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

######### AF ############
af <- (fread("~/admixture_mapping/variants/gwas/AF.raw"))
af.1 <- as.data.frame(af)
af.2 <- t(af.1[,7:ncol(af)])
colnames(af.2) <- af.1$FID
af.3 <-cbind(data.frame(snpname=row.names(af.2), a1=rep(0,nrow(af.2)), a2=rep(1, nrow(af.2))), af.2)
af.3$snpname <- gsub("_[A-Z]", "", af.3$snpname)
af.3$snpname <- gsub("_[0-9]", "", af.3$snpname)

write.table(af.3, "af.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
af.snp.annot <- data.frame(snp.id=af.3$snpname, pos=str_split_fixed(af.3$snpname, ":", 2)[,2], chr=str_split_fixed(af.3$snpname, ":", 2)[,1] )
write.table(af.snp.annot, "af.snp.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

########## AF.BC ###########
af.bc <- (fread("~/admixture_mapping/variants/gwas/AF.BC.raw"))
af.bc.1 <- as.data.frame(af.bc)
af.bc.2 <- t(af.bc.1[,7:ncol(af.bc)])
#a <- (format(round(af.bc.2, 2), nsmall = 2))
colnames(af.bc.2) <- af.bc.1$FID
af.bc.3 <-cbind(data.frame(snpname=row.names(af.bc.2), a1=rep("A",nrow(af.bc.2)), a2=rep("T", nrow(af.bc.2))), af.bc.2)
af.bc.3$snpname <- gsub("_[A-Z]", "", af.bc.3$snpname)
af.bc.3$snpname <- gsub("_[0-9]", "", af.bc.3$snpname)

write.table(af.bc.3, "af.bc.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
af.bc.snp.annot <- data.frame(snp.id=af.bc.3$snpname, pos=str_split_fixed(af.bc.3$snpname, ":", 2)[,2], chr=str_split_fixed(af.bc.3$snpname, ":", 2)[,1] )
write.table(af.bc.snp.annot, "af.bc.snp.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

###############################################
#### parent pops included

######## CB ############
cb <- (fread("~/admixture_mapping/variants/gwas/CB.raw"))
cb.1 <- as.data.frame(cb)
cb.2 <- t(cb.1[,7:ncol(cb)])
colnames(cb.2) <- cb.1$FID
cb.3 <-cbind(data.frame(snpname=row.names(cb.2), a1=rep(0,nrow(cb.2)), a2=rep(1, nrow(cb.2))), cb.2)
cb.3$snpname <- gsub("_[A-Z]", "", cb.3$snpname)
cb.3$snpname <- gsub("_[0-9]", "", cb.3$snpname)

#write bimbam file
write.table(cb.3, "cb.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
cb.snp.annot <- data.frame(snp.id=cb.3$snpname, pos=str_split_fixed(cb.3$snpname, ":", 2)[,2], chr=str_split_fixed(cb.3$snpname, ":", 2)[,1] )
write.table(cb.snp.annot, "cb.snp.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


######## AC ############
ac <- (fread("~/admixture_mapping/variants/gwas/AC.raw"))
ac.1 <- as.data.frame(ac)
ac.2 <- t(ac.1[,7:ncol(ac)])
colnames(ac.2) <- ac.1$FID
ac.3 <-cbind(data.frame(snpname=row.names(ac.2), a1=rep(0,nrow(ac.2)), a2=rep(1, nrow(ac.2))), ac.2)
ac.3$snpname <- gsub("_[A-Z]", "", ac.3$snpname)
ac.3$snpname <- gsub("_[0-9]", "", ac.3$snpname)

#write bimbam file
write.table(ac.3, "ac.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
ac.snp.annot <- data.frame(snp.id=ac.3$snpname, pos=str_split_fixed(ac.3$snpname, ":", 2)[,2], chr=str_split_fixed(ac.3$snpname, ":", 2)[,1] )
write.table(ac.snp.annot, "ac.snp.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")


######## N_S_remove ############
N_S_remove <- (fread("~/admixture_mapping/variants/gwas/N_S.remove.raw"))
N_S_remove.1 <- as.data.frame(N_S_remove)
N_S_remove.2 <- t(N_S_remove.1[,7:ncol(N_S_remove)])
colnames(N_S_remove.2) <- N_S_remove.1$FID
N_S_remove.3 <-cbind(data.frame(snpname=row.names(N_S_remove.2), a1=rep(0,nrow(N_S_remove.2)), a2=rep(1, nrow(N_S_remove.2))), N_S_remove.2)
N_S_remove.3$snpname <- gsub("_[A-Z]", "", N_S_remove.3$snpname)
N_S_remove.3$snpname <- gsub("_[0-9]", "", N_S_remove.3$snpname)

#write bimbam file
write.table(N_S_remove.3, "N_S.remove.bimbam.geno", row.names=FALSE, col.names=FALSE, quote=FALSE, sep=",")
#write snp annotation file
N_S_remove.snp.annot <- data.frame(snp.id=N_S_remove.3$snpname, pos=str_split_fixed(N_S_remove.3$snpname, ":", 2)[,2], chr=str_split_fixed(N_S_remove.3$snpname, ":", 2)[,1] )
write.table(N_S_remove.snp.annot, "N_S.remove.snp.annotate", row.names=FALSE, col.names=FALSE, quote=FALSE, sep="\t")

