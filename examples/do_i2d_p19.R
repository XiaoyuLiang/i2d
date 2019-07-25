rm(list=ls());
setwd("C:/Users/xl535/Box Sync/Hu/20190213_i2d/i2d_test")
###Clustering methods: kmeans GCluster mstGCluster######
###GCluster and mstGCluster are in GCluster package##### 
###mstGCluster k=0: find points to draw segments

library(GCluster);
set.seed(1234);
p.n <- c(500, 1000);

pdf("do_i2d_p19.pdf", 7, 6);
par(mfrow=c(2,2), mar=c(2,2,2,2));
  image.file <- paste0("data_sets/p19.png");
  out        <- i2d(image=image.file, p.n=p.n[1]);
  img        <- readImage(image.file);
  dat        <- as.matrix(out);
  out.km     <- kmeans(dat, 12);
  out2       <- GCluster(dat=dat, wt=4, k=12);
  cols <- rainbow(12, alpha=0.5);
  EBImage::display(img, method="raster", all=TRUE);
  out.mst    <- mstGCluster(dat=out, k=0);
  plot(dat, col=cols[out.km$cluster], main="", pch=19, axes=F);
  plot(dat, type="n", main="", xlab="", ylab="", axes=F); ###for the following points plot
  points(dat, pch=19, col=cols[out2$membership], cex=1.2);
  out3 <- out.mst[,c(2,3,5,6)];
  segments(as.numeric(out3[,1]), as.numeric(out3[,2]), 
           as.numeric(out3[,3]), as.numeric(out3[,4]), col=cols[9], lwd=2);
  
  out        <- i2d(image=image.file, p.n=p.n[2]);
  img        <- readImage(image.file);
  dat        <- as.matrix(out);
  out2       <- GCluster(dat=dat, wt=4, k=12);
  out.mst    <- mstGCluster(dat=out, k=0);
  plot(dat, type="n", main="", xlab="", ylab="", axes=F);
  points(dat, pch=19, col=cols[out2$membership], cex=1.2);
  out3 <- out.mst[,c(2,3,5,6)];
  segments(as.numeric(out3[,1]), as.numeric(out3[,2]), 
           as.numeric(out3[,3]), as.numeric(out3[,4]), col=cols[9], lwd=2);
dev.off()


