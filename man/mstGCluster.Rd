\name{mstGCluster}
\alias{mstGCluster}

\title{
 mstGCluster: A Graph Clustering Algorithm Based on Minimum Spanning Tree
}

\description{
The minimum spanning tree-based graph clustering algorithm (mstGCluster) not only can be used to group the vertices into a specific number of clusters but also can filter the noise in the graph.
}

\usage{
mstGCluster(dat=dat, k=2, filter=FALSE, filter.n=10, filter.d=0)
}

\arguments{
   \item{dat}{data.frame or matrix of x-coordinate and y-coordinate.}
   \item{k}{integer: number of clusters. Default is \code{k=2}. If \code{k=0}, the function will return the path of minimum spanning tree.}
   \item{filter}{logical: if \code{FALSE} (the default), no vertices will be removed, otherwise the outliers will be filtered.}
   \item{filter.n}{integer: minimum number of vertices of each cluster. If \code{filter=TRUE}, it will be used as cluster size cutoff. This argument specifies filter the clusters that contain number of vertices less than specific number \code{filter.n}. }
   \item{filter.d}{a positive value: this argument specifies the minimum distance of vertices that not be filtered. If \code{filter=TRUE}, it will be used as weight/distance cutoff. If \code{filter.d=0} (the default), the cutoff will be calculated by k-means clustering algorithm.}
}

\author{
Ying Hu \email{yhu@mail.nih.gov}

Chunhua Yan \email{yanch@mail.nih.gov}

Xiaoyu Liang \email{xiaoyu.liang@yale.edu}
}

\references{
Csardi, G., & Nepusz, T. (2006). The igraph software package for complex network research. InterJournal, complex systems, 1695(5), 1-9.
}

\examples{
data(Noise_Filtering,package="i2d")
dat1 <- i2d(image=Noise_Filtering, p.n=500);
out1 <- mstGCluster(dat=dat1, k=2, filter=TRUE, filter.n=10);
col1 <- rainbow(10, alpha=0.5)[c(1,2,7,9)];

## The original image
EBImage::display(Noise_Filtering)
## Plot the 500 randomly selected vertices
plot(dat1, col="black", pch=19, main="Raw Data");
## Outliers detection
plot(out1$outlier, col="black", pch=19, main="Outliers Filtered Before Clustering");
## Plot the clusters after flitering noise
plot(out1$dat, col=col1[out1$clu$membership], pch=19, main="Cluster After Filtering")
}

