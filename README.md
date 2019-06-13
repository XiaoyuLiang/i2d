# i2d: An R Package for Simulating Data from Image to Evaluate Performance of Clustering Algorithms
The R package i2d is a novel tool that allows simulating data extracted from image. Users can easily draw a simple image to create or simulate a complex data. The simulated data can be used to evaluate the performances of the clustering algorithms, especially in the fields of the single cell data analysis, such as trajectory analysis. The package also includes three novel and efficient methods for image clustering based on finding minimum spanning tree by Prim's algorithm, detecting communities by modularity optimization, and finding the branches of the backbone of minimum spanning tree.

The package can be used for generating data sets for

1. cluster
2. single cell analysis (cluster and trajectory)
3. 2D and 3D data set visualization


## 1. Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("EBImage")
BiocManager::install("igraph")
```

### Installation
Clone this repo to your local machine using `https://github.com/XiaoyuLiang/i2d`
You can install the stable version of R/igraph from CRAN:
```
install.packages("i2d")
```
For the development version, you can use Github, with the devtools package:
```
devtools::install_github("XiaoyuLiang/R_code/i2d")
```
Once i2d is installed, it can be loaded by the following command.
```
library("i2d")
```

## 2. Running the tests
```
img.file = system.file("images", "circles.png", package="i2d")
img = readImage(img.file)
```

## 3. Built With
* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## 4. Bug reports and feature requests
Bug reports, feature requests, or any other issues with the package should be reported at https://github.com/XiaoyuLiang/i2d/issues.

## 5. Contributions
Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## 6. Authors
* **Ying Hu** 
* **Xiaoyu Liang** - xiaoyu.liang@yale.edu

## 7. Acknowledgments
Ying Hu designed research and wrote R package.
