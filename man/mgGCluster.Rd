\name{mgGCluster}
\alias{mgGCluster}

\title{
 mgGCluster: Merge clusters for Graph Clustering Algorithm
}

\description{
 \code{mgGCluster} is used for merging clusters when the number of clusters is larger than the  desired number.
}

\usage{
  mgGCluster(x, l, rename=TRUE);
}

\arguments{
   \item{x}{vector: cluster ID}
   \item{l}{list: each object is vector. All clusters will be renamed as the first one}
   \item{rename}{logical: if \code{TRUE}, the ID will be renamed.}
}

\author{
Ying Hu \email{yhu@mail.nih.gov}

Chunhua Yan \email{yanch@mail.nih.gov}

Xiaoyu Liang \email{xiaoyu.liang@yale.edu}
}



