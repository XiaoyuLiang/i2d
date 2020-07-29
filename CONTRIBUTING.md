# Contributing

Thanks for considering contributing our i2d package. When contributing to this repository, please first discuss the change you wish to make via [Issues](https://github.com/XiaoyuLiang/i2d/issues), email (xiaoyu.liang@yale.edu), or any other method with the owners of this repository before making a change. 

## Report a bug

Before reporting a bug, please ensure the bug was not already reported by searching on GitHub under [Issues](https://github.com/XiaoyuLiang/i2d/issues). 

* Your operating system name and version (e.g. Windows 10 10.0, Mac OS 10.15.6).
* Detailed steps to reproduce the bug.
* Any details about your local setup that might be helpful in troubleshooting.

## Propose an idea 

Have an idea for a new i2d feature? Take a look at the [Main Page](https://github.com/XiaoyuLiang/i2d) and [Issues](https://github.com/XiaoyuLiang/i2d/issues) to see if it is included or suggested. If not yet, suggest your idea as an [issue on i2d](https://github.com/XiaoyuLiang/i2d/issues). While we can't promise to implement your idea, it helps to:

* Explain in detail how it would work.
* Keep the scope as narrow as possible.
* Give an example of possible.

## Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a build.
2. Update the README.md with details of changes to the interface, this includes new environment variables, exposed ports, useful file locations and container parameters.
3. Increase the version numbers in any examples files and the README.md to the new version that this Pull Request would represent. 
4. You may merge the Pull Request in once you have the sign-off of two other developers, or if you do not have permission to do that, you may request the second reviewer to merge it for you.

## Improve the package documentation

#### Function documentation

Functions are described as comments near their code. If you want to improve a function description or make any change of the function, we recommend you to upload a new function with a new name. 

1. Go to `R/` directory in the [code repository](https://github.com/XiaoyuLiang/i2d/tree/master/R/).
2. [Upload the function documentation](https://github.com/XiaoyuLiang/i2d/tree/master/R/).

## Development guidelines

We try to follow the [GitHub flow](https://guides.github.com/introduction/flow/) for development.

1. Fork [this repo](https://github.com/XiaoyuLiang/i2d) and clone it to your computer. To learn more about this process, see [this guide](https://guides.github.com/activities/forking/).
2. If you have forked and cloned the project before and it has been a while since you worked on it, [pull changes from the original repo](https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/) to your clone by using `git pull upstream master`.
3. Open the RStudio project file (`.Rproj`).
4. Make your changes:
    * Write your code.
    * Test your code (bonus points for adding unit tests).
    * Document your code (see function documentation above).
    * Check your code with `devtools::check()` and aim for 0 errors and warnings.
5. Commit and push your changes.
6. Submit a [pull request](https://guides.github.com/activities/forking/#making-a-pull-request).
