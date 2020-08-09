

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

  out.n  <- out2$vpath[[1]]$name;
  v1 <- out.n[1];
  if(length(out2$vpath[[1]])<2){
    v2=v1
    v1.i <- v2.i <- which(row.names(m)==v1);
    out.p <- c(m[v1.i,1], m[v1.i,2], m[v2.i,1], m[v2.i,2]);
    path.name=paste0(v1,"->",v2)
  }else{
    out.p  <- NULL;
    path.name <- NULL
    for (i in 2:length(out2$vpath[[1]])){
      v2   <- out2$vpath[[1]]$name[i];
      v1.i <- which(row.names(m)==v1);
      v2.i <- which(row.names(m)==v2);
      out.p <- rbind(out.p, c(m[v1.i,1], m[v1.i,2], m[v2.i,1], m[v2.i,2]));
      path.name=c(path.name,paste0(v1,"->",v2));
      v1    <- v2;
    }
  }
  # colnames(out.p)=c("from-x","from-y","to-x","to-y")
  # rownames(out.p)=path.name
  list(coord=out.p, node=out.n, mst=mst.g);
}

