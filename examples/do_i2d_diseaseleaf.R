rm(list=ls());
setwd("C:/Users/xl535/Box Sync/Hu/20190213_i2d/i2d_test")
###mstGCluster: cluster and clear outliers#########

library(i2d);

set.seed(1234);
dat1  <- i2d(image="./data_sets/diseaseleaf-1.jpg", p.n=10000); ###dim(dat1): p.n*2 (x and y)
out1  <- mstGCluster(dat=dat1, k=20, filter=FALSE);
col1 <- rainbow(20, alpha=0.5);

ifpng=T
if (ifpng) {
  width0=16
  height0=6
  res0=600
  outfile="do_i2d_diseaseleaf.png"
  png(outfile, width = width0, height = height0, units = 'in', res = res0)
  par(
    mfrow = c(1, 2),
    mar = c(1, 0, 2, 0) + 0.1,
    oma = c(0.3, 0, 0.3, 0) + 0.1
  )
}
#par(mfrow=c(1,2));
plot(dat1, col="black", pch=19, main="",axes=FALSE, frame.plot=FALSE,xlab="",ylab="");
plot(out1$dat, col=col1[out1$clu$membership], pch=19, main="",axes=FALSE, frame.plot=FALSE,xlab="",ylab="");
dev.off()


numcluster=4
dat2  <- i2d(image="./data_sets/circles.png", p.n=10000); 
out2  <- mstGCluster(dat=dat2, k=numcluster, filter=FALSE);
#col2 <- rainbow(10, alpha=0.5)[1:numcluster];
col2 <- c("olivedrab4","darkorange3","dodgerblue4","firebrick3")
ifpng=T
if (ifpng) {
  width0=15
  height0=7.5
  res0=600
  outfile="do_i2d_circles.png"
  png(outfile, width = width0, height = height0, units = 'in', res = res0)
  par(
    mfrow = c(1, 2),
    mar = c(1, 0, 2, 0) + 0.1,
    oma = c(0.3, 0, 0.3, 0) + 0.1
  )
}
plot(dat2, col="black", pch=19, main="",axes=FALSE, frame.plot=FALSE,xlab="",ylab="")
plot(out2$dat, col=col2[out2$clu$membership], pch=19, main="",axes=FALSE, frame.plot=FALSE,xlab="",ylab="")
dev.off()
