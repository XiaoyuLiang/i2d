\name{branch_list}
\alias{branch_list}

\title{
 branch_list: Get Branch for Each Node on the Tree or Path
}

\description{
\code{branch_list} returns a list of branches for the nodes on the tree or path. It can be used for obtainning the branches for the nodes on the spine skeleton of minimum spanning tree.
}

\usage{
branch_list(g, nodes);
}

\arguments{
   \item{g}{graph object}
   \item{nodes}{character: vertices of the branch}
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
plot(tj$mst)
br.list  <- branch_list(tj$mst, tj$node)
}

