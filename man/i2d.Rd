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
 Ying Hu <yhu@mail.nih.gov>
 Chunhua Yan <yanch@mail.nih.gov>
}

\references{
Pau, G., Fuchs, F., Sklyar, O., Boutros, M., & Huber, W. (2010). EBImage--an R package for image processing with applications to cellular phenotypes. Bioinformatics, 26(7), 979-981. doi: 10.1093/bioinformatics/btq046
}

\examples{
image.file = system.file("images", "p01.png", package="i2d")
image.dat  <- i2d(image=image.file, p.n=10000)
}

