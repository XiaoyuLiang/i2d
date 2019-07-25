
rm(list=ls());

library(i2d);
library(scatterplot3d);
imgs <- c("./images/p01.png","./images/p09.png","./images/p_c.png","./images/p01.png","./images/p_c2.png");
set.seed(1234);

####################################################################
# Example 1 : convert 2D image into digital coordinates using i2d()
par(mfrow=c(2,3))
cex.main0=3
pch0=19
cols <- c("black","black")

img.1r = readImage(imgs[1])
EBImage::display(img.1r, method="raster")
img.1l <- i2d(image=imgs[1], p.n=p.n0[1])
img.1h <- i2d(image=imgs[1], p.n=p.n0[2])
plot(img.1l, col=cols[1], pch=pch0,main= paste0("p.n = ", p.n0[1]),cex.main=cex.main0,xlab = "",ylab = "")
plot(img.1h, col=cols[2], pch=pch0,main= paste0("p.n = ", p.n0[2]),cex.main=cex.main0,xlab = "",ylab = "")

img.2r = readImage(imgs[2])
EBImage::display(img.2r, method="raster")
img.2l <- i2d(image=imgs[2], p.n=p.n0[1])
img.2h <- i2d(image=imgs[2], p.n=p.n0[2])
plot(img.2l, col=cols[1], pch=pch0,main= paste0("p.n = ", p.n0[1]),cex.main=cex.main0,xlab = "",ylab = "")
plot(img.2h, col=cols[2], pch=pch0,main= paste0("p.n = ", p.n0[2]),cex.main=cex.main0,xlab = "",ylab = "")

####################################################################
# Example 2 : simulate data points for 3D image using i2d(). 
# i2d() function can also generate 3D digital coordinates by combining two 2D image. 

dat            <- i2d(image=imgs[3], p.n=1000);
out.s          <- data.frame(x=dat[,1], y=sample(1:20, nrow(dat), rep=T), z=dat[,2]);
row.names(dat) <- paste0("n", 1:nrow(dat));
out            <- tjGCluster2(dat); 
out2           <- tree_list(out$mst, out$node); 
cols           <- rainbow(10, alpha=0.6);

l.n   <- length(out2);
col.n <- colorRampPalette(cols)(l.n);
n2col <- NULL;
for (i in 1:l.n){
  tmp   <- unlist(out2[[i]]);
  tmp.s <- data.frame(n=tmp, cols=rep(col.n[i], length(tmp)))
  n2col <- rbind(n2col, tmp.s);
}

row.names(out.s) <- row.names(dat);
n.i              <- match(row.names(out.s), n2col[,1]);
n2col            <- n2col[n.i,]

par(mfrow=c(1,3))
img.3r = readImage(imgs[3])
EBImage::display(img.3r, method="raster")
plot(dat, col=n2col[,2], pch=19, axes=F, xlab="", ylab="", main="", cex=3);
scatterplot3d(out.s$x, y=out.s$y, z=out.s$z,
              color = n2col[,2], pch=19,
              xlab = "", ylab = "", zlab = "");

####################################################################

# Example 3 : simulate data points for 3D image using i2d().

f <- function(x){ (x - min(x))/(max(x)-min(x)) * (1.6 - 0) + 0};
dat            <- i2d(image=imgs[4],   p.n=2000);
dat2           <- i2d(image=imgs[5],  p.n=2000);
dat2           <- dat2[order(dat2[,1]),];
r              <- f(dat2[,2]);
x              <- dat[,1];
z              <- dat[,2] + r;
y              <- seq(1.5, 2.5, length.out = 2000);
## 3d data
out.s          <- data.frame(x=x, y=y, z=z);

## for colors
row.names(dat) <- paste0("n", 1:nrow(dat));
out            <- tjGCluster2(dat);
out2           <- tree_list(out$mst, out$node);
cols           <- rainbow(10, alpha=0.6);

l.n   <- length(out2);
col.n <- colorRampPalette(cols)(l.n);
n2col <- NULL;
for (i in 1:l.n){
  tmp   <- unlist(out2[[i]]);
  tmp.s <- data.frame(n=tmp, cols=rep(col.n[i], length(tmp)))
  n2col <- rbind(n2col, tmp.s);
}

row.names(out.s) <- row.names(dat);
n.i              <- match(row.names(out.s), n2col[,1]);
n2col            <- n2col[n.i,]

par(mfrow=c(1,3))
img.1r = readImage(imgs[4])
EBImage::display(img.1r, method="raster")
img.2r = readImage(imgs[5])
EBImage::display(img.2r, method="raster")
scatterplot3d(out.s$x, y=out.s$y, z=out.s$z,
              color = n2col[,2], pch=19,
              xlab = "", ylab = "", zlab = "");

####################################################################

# Example 4: image clustering using mstGCluster() function. 
# mstGCluster() can be used for outliers detection and image clustering based on k-means clustering and minimum spanning tree. 

set.seed(1234);
dat1  <- i2d(image="./data_sets/p12.png", p.n=400); ###dim(dat1): p.n*2 (x and y)
out1  <- mstGCluster(dat=dat1, k=2, filter=TRUE, filter.n=10);
dat2  <- i2d(image="./data_sets/p08.png", p.n=800);
out2  <- mstGCluster(dat=dat2, k=10, filter=FALSE);

col1 <- rainbow(10, alpha=0.5)[c(1,2,7,9)];
col2 <- rainbow(10, alpha=0.5);
par(mfrow=c(1,3))
plot(dat1, col="blue", pch=19, cex.main=2,main="Raw Data",xlab="",ylab="");
plot(out1$outlier, col="black", pch=19, cex.main=2, main="Outliers Filtered Before Clustering",xlab="",ylab="");
plot(out1$dat, col=col1[out1$clu$membership], pch=19,cex.main=2, main="Cluster After Filtering",xlab="",ylab="");

####################################################################

# Example 5: Some examples for image clustering using i2d package. 
library(GCluster);
set.seed(1234);
## k number
f.c <- c(2, 2, 3, 4, 4, 4, 2, 10, 9, 10, 5, 2);
## simulation data size
f.n <- c(rep(400, 6), 1500, 800, 3500, 2500, 2000, 400)+500

par(mfcol=c(4,4))
for (i in 1:8){
  print(i);
  if (i < 10){
    infile <- paste0("data_sets/p0", i, ".png"); 
  } else {
    infile <- paste0("data_sets/p", i, ".png"); 
  }
  dat  <- i2d(infile, p.n=f.n[i]);
  dat  <- as.matrix(dat);
  if (i == 12){
    out  <- mstGCluster(dat, k=f.c[i], filter=TRUE, filter.n=10);
  } else {
    out  <- mstGCluster(dat, k=f.c[i], filter=FALSE);
  }
  
  img.1r = readImage(infile)
  EBImage::display(img.1r , method="raster")
  main <- paste0("k= ", f.c[i]);
  cols <- rainbow(f.c[i], alpha=0.5);
  plot(out$dat, col=cols[out$clu$membership], main=main, pch=19,cex.main=3,xlab="",ylab="");
  if(i==12){
    points(out$outlier, pch=19, col="gray50");
  }
}


