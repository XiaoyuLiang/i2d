\name{tjGCluster}
\alias{tjGCluster}

\title{
tjGCluster: Trajectory Analysis for Finding the Spine Skeleton of Minimum Spanning Tree
}

\description{
\code{tjGCluster} is used for trajectory analysis. It returns a list including the shortest path for maximum distance positions in the minimum spanning tree (the spine skeleton), the nodes on the spine skeleton, and the minimum spanning tree. If the input data is an igraph object, the function will return the nodes on the spine skeleton and the minimum spanning tree.
}

\usage{
tjGCluster(m, from=NULL, to=NULL);
}

\arguments{
   \item{m}{data.frame or matrix of x-coordinate and y-coordinate, or igraph object.}
   \item{from}{start vetex: If \code{from=NULL} (the default), the spine skeleton returns, otherwise, the path starts from the given vertex.}
   \item{to}{end vetex: If \code{from=NULL} (the default), , the spine skeleton returns, otherwise, the path ends at the given vertex.}
}

\value{
   \item{coord}{matrix: the x-coordinate and y-coordinate of the shortest path for maximum distance positions in the minimum spanning tree (the spine skeleton).}
   \item{node}{the nodes on the spine skeleton.}
   \item{mst}{the minimum spanning tree.}
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
data(i2d_Example,package="i2d")

## Just use 30 points as an example
dat <- i2d(image=i2d_Example, p.n=30)
tj=tjGCluster(dat, from=NULL, to=NULL)

## Plot the minimum spanning tree
plot(tj$mst)
## Check the nodes on the spine skeleton
tj$node
## Check the shortest path for maximum distance positions in the minimum spanning tree
tj$coord
}

