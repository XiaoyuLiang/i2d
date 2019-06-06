
##tjGCluster2: get the spine skeleton vertices and path of MST
##tjGCluster: also get branch list for the spine skeleton vertices of graph

###if no branch length > 26, done. return the following items
###1. the shortest path for maximum distance position in the MST:
###   a matrix(starting(x,y) to ending (x,y))
#coord=tj.out$coord
###2. the shortest path for maximum distance position in the MST
###   the spine skeleton vertices of graph
#node=tj.out$node
###3. MST
#mst=tj.out$mst
###4. branch list for the spine skeleton vertices of graph
#level=br.list

tjGCluster <- function(m, from=NULL, to=NULL){
  if (class(m)=="data.frame" | class(m)=="matrix"){
    dat.d <- dist(m);
    g     <- igraph::graph_from_adjacency_matrix(as.matrix(dat.d), weighted =T, mode = "upper");
    level <- 1;
  } else if (class(m)=="igraph"){
    g  <- m;
    m  <- igraph::get.adjedgelist(g);
    level <- 2;
  }
  mst.g  <- igraph::minimum.spanning.tree(graph=g, weights=E(g)$weight);
  out.s  <- igraph::shortest.paths(mst.g, v=V(mst.g), to=V(mst.g));
  out1   <- which(out.s==max(out.s), arr.ind = TRUE);
  if (is.null(from) & is.null(to)){
    out2   <- igraph::get.shortest.paths(mst.g, from=V(mst.g)$name[out1[1]], 
                                 to=V(mst.g)$name[out1[2]], mode="all");
  } else if (is.null(to)){
    out2   <- igraph::get.shortest.paths(mst.g, from=from, 
                                 to=V(mst.g)$name[out1[2]], mode="all");
  } else if (is.null(from)){
    out2   <- igraph::get.shortest.paths(mst.g, from=V(mst.g)$name[out1[1]], 
                                 to=to, mode="all");
  } else {
    out2   <- igraph::get.shortest.paths(mst.g, from=from, 
                                 to=to, mode="all");
  }
  if (level==2){
    out.n  <- out2$vpath[[1]]$name;
    return(list(node=out.n, mst.g=mst.g))
  }
  v1     <- out2$vpath[[1]]$name[1];
  out.p  <- NULL;
  out.n  <- out2$vpath[[1]]$name;
  for (i in 2:length(out2$vpath[[1]])){
    v2   <- out2$vpath[[1]]$name[i];
    v1.i <- which(row.names(m)==v1);   
    v2.i <- which(row.names(m)==v2);
    out.p <- rbind(out.p, c(m[v1.i,1], m[v1.i,2], m[v2.i,1], m[v2.i,2]));
    v1    <- v2;
  }
  list(coord=out.p, node=out.n, mst=mst.g);
}

