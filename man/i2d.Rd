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
}

