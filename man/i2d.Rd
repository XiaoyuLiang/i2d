\name{i2d}
\alias{i2d}

\title{
convert 2D image into digital coordinates
}

\description{
convert 2D image into digital coordinates
}

\usage{
i2d(image=image, p.n=500, scale=T);
}

\arguments{
   \item{image}{image file, type of file can be PNG, JPEG, TIF, or RAW}
   \item{p.n}{number of points}
   \item{scale}{a logical value, if scale the output coordinates}
}

\author{
Ying Hu \email{yhu@mail.nih.gov}

Chunhua Yan \email{yanch@mail.nih.gov}

Xiaoyu Liang \email{xiaoyu.liang@yale.edu}
}

\references{
Pau, G., Fuchs, F., Sklyar, O., Boutros, M., & Huber, W. (2010). EBImage--an R package for image processing with applications to cellular phenotypes. Bioinformatics, 26(7), 979-981. doi: 10.1093/bioinformatics/btq046

Csardi, G., & Nepusz, T. (2006). The igraph software package for complex network research. InterJournal, complex systems, 1695(5), 1-9.
}

\examples{
data(i2d_Example,package="i2d")
col=rgb(0, 0, 1, max = 1, alpha = 0.2)
mickey <- i2d(image=i2d_Example, p.n=5000)
mickey1 <- i2d(image=i2d_Example, p.n=10000)
par(mfrow=c(1,2))
plot(mickey, pch=19,col=col,main="i2d: 5000 points")
plot(mickey1, pch=19,col=col,main="i2d: 10000 points")

## Example for 3D data simulation
data(simulate_3D_data_1,package="i2d")
data(simulate_3D_data_2,package="i2d")
f <- function(x){ (x - min(x))/(max(x)-min(x)) * (1.6 - 0) + 0};
dat            <- i2d(image=simulate_3D_data_1,  p.n=1000);
dat2           <- i2d(image=simulate_3D_data_2,  p.n=1000);
dat2           <- dat2[order(dat2[,1]),];
r              <- f(dat2[,2]);
x              <- dat[,1];
z              <- dat[,2] + r;
y              <- seq(1.5, 2.5, length.out = 1000);
## 3d data
out.s          <- data.frame(x=x, y=y, z=z);

## for colors
row.names(dat) <- paste0("n", 1:nrow(dat));
out            <- tjGCluster(dat);
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
# library(scatterplot3d)
# scatterplot3d(out.s$x, y=out.s$y, z=out.s$z,
#               color = n2col[,2], pch=19,
#               xlab = "", ylab = "", zlab = "")

}

