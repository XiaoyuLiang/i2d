rm(list=ls());
setwd("C:/Users/xl535/Box Sync/Hu/20190213_i2d/i2d_test")
###mstGCluster: cluster and clear outliers#########

library(i2d);

set.seed(1234);
dat1  <- i2d(image="./data_sets/p12.png", p.n=400); ###dim(dat1): p.n*2 (x and y)
out1  <- mstGCluster(dat=dat1, k=2, filter=TRUE, filter.n=10);
dat2  <- i2d(image="./data_sets/p08.png", p.n=800);
out2  <- mstGCluster(dat=dat2, k=10, filter=FALSE);

col1 <- rainbow(10, alpha=0.5)[c(1,2,7,9)];
col2 <- rainbow(10, alpha=0.5);

pdf("do_i2d01.pdf", 8, 8);
par(mfrow=c(2,2));
plot(dat1, col="blue", pch=19, main="Raw Data");
plot(out1$dat, col=col1[out1$clu$membership], pch=19, main="Cluster After Filtering");
plot(out1$outlier, col="black", pch=19, main="outliers Filtered Before Clustering");
plot(out2$dat, col=col2[out2$clu$membership], pch=19, main="Cluster After Filtering");
dev.off()

dat3  <- i2d(image="./data_sets/p08.png", p.n=2000);
out3  <- mstGCluster(dat=dat3, k=10, filter=T);
plot(out3$dat, col=col2[out3$clu$membership], pch=19, main="Cluster After Filtering")
out3$outlier

