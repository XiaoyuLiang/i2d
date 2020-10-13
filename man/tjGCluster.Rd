\name{tjGCluster}
\alias{tjGCluster}

\title{
tjGCluster: Trajectory Analysis for Finding the Spine Skeleton and the Branches of the Backbone of Minimum Spanning Tree
}

\description{
\code{tjGCluster} is used for trajectory analysis. It returns a list including (1) the shortest path for maximum distance positions in the minimum spanning tree (the path of the spine skeleton of minimum spanning tree); (2) the nodes on the spine skeleton; (3) and the minimum spanning tree; (4) the branches of the backbone of the minimum spanning tree. If the input data is an igraph object, the function will return the nodes on the spine skeleton and the minimum spanning tree.
}

\usage{
tjGCluster(m, from=NULL, to=NULL, cutoff=26);
}

\arguments{
   \item{m}{data.frame or matrix of x-coordinate and y-coordinate, or igraph object.}
   \item{from}{start vetex: If \code{from=NULL} (the default), the spine skeleton returns, otherwise, the path starts from the given vertex.}
   \item{to}{end vetex: If \code{from=NULL} (the default), , the spine skeleton returns, otherwise, the path ends at the given vertex.}
   \item{cutoff}{branch cut-off value: branches will return with vertex number > \code{cutoff}.}
}

\value{
   \item{coord}{matrix: the xy-coordinate of the shortest path for maximum distance positions in the minimum spanning tree (the spine skeleton). If some brancches have number of vertices > cutoff, the matrix will also include the xy-coordinate of the branches.}
   \item{node}{the nodes on the spine skeleton.}
   \item{mst}{the minimum spanning tree.}
   \item{level1}{list: branch list on the spine skeleton.}
   \item{level2}{list: branch list on the long branch with vertex number > \code{cutoff}.}
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
tj=tjGCluster(dat, from=NULL, to=NULL, cutoff=2)

## Plot the minimum spanning tree
plot(tj$mst)
## Check the nodes on the spine skeleton
tj$node
## Check the shortest path for maximum distance positions in the minimum spanning tree
tj$coord
## Check the branches on the minimum spanning tree
tj$level1
tj$level2
}

