\name{codeGCluster}
\alias{codeGCluster}

\title{
 codeGCluster: A Graph Clustering Algorithm Based on Community Detection
}

\description{
The community detection-based graph clustering algorithm (codeGCluster) is baed on community detection methods, such as Louvain algorithm, fast-greedy modularity optimization algorithm, and near linear time algorithm. \code{codeGCluster} retruns community information.
}

\usage{
codeGCluster(dat=dat, wt=4, k=NULL, diff_distance=0.1, method="louvain");
}

\arguments{
   \item{dat}{data.frame or matrix of x-coordinate and y-coordinate.}
   \item{wt}{weight: the initial distance cut-off value. The weight of edge larger than \code{wt} will be removed.}
   \item{k}{integer: number of clusters. If \code{k=NULL} (the default), graph will be automatically clustered using a community detection method in igraph package. Otherwise, graph can be forced to cluster into \code{k} clusters.}
    \item{diff_distance}{numeric value: distance change for each iteration.}
   \item{method}{character: method for community detection. The method should be one of \code{"louvain"}, \code{"fast_greedy"}, \code{"infomap"}, \code{"label_prop"}, or \code{"spinglass"}.}
}

\author{
Ying Hu \email{yhu@mail.nih.gov}

Chunhua Yan \email{yanch@mail.nih.gov}

Xiaoyu Liang \email{xiaoyu.liang@yale.edu}
}

\references{
Csardi, G., & Nepusz, T. (2006). The igraph software package for complex network research. InterJournal, complex systems, 1695(5), 1-9.

Blondel, V. D., Guillaume, J.-L., Lambiotte, R., & Lefebvre, E. (2008). Fast unfolding of communities in large networks. Journal of statistical mechanics: theory and experiment, 2008(10), P10008.

Clauset, A., Newman, M. E. J., & Moore, C. (2004). Finding community structure in very large networks. Physical review E, 70(6), 066111.

Raghavan, U. N., Albert, R., & Kumara, S. (2007). Near linear time algorithm to detect community structures in large-scale networks. Physical review E, 76(3), 036106.
Reichardt, J., & Bornholdt, S. (2006). Statistical mechanics of community detection. Physical review E, 74(1), 016110.
}

\examples{
data(Cluster_Example_3,package="i2d")
set.seed(1234)
dat <- i2d(image=Cluster_Example_3, p.n=500)

## Perform graph clustering method based on a community detection algorithm
out <-codeGCluster(dat=dat, wt=4, k=4, method="louvain",diff_distance=0.5)

## Plot the clutered vertices
cols <- rainbow(12, alpha=0.5)
plot(dat, pch=19, col=cols[out$membership], cex=1.2)
}

