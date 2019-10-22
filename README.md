# gatsby-docker
Develop &amp; Build [GatsbyJS](https://www.gatsbyjs.org/) static sites within a [Docker](https://www.docker.com/) container.

- 🚮  **Clutter-free host machine**: No need to install Node/Gatsby/Webpack/etc on your host machine! Only Docker required (tested on `v17.12.0`).
- 🏗  **Easy setup**: Automatic GatsbyJS site initializion with [`gatsby-starter-default`](http://gatsbyjs.github.io/gatsby-starter-default/) (unless already initialized)
- 👍  **Simple CLI API**: [`develop`/`stage`/`build`](#usage)
- 🆕  **Recent NodeJS**: Container based on NodeJS `v10.15.2` running in Ubuntu Linux 19.04
- 📃  [MIT](https://github.com/IgorMazur/gatsby-docker/blob/master/LICENSE)-licensed



## Setup

**NOTE**: Your GatsbyJS site will be created into `$(pwd)/site` automatically.

Add these to your `.gitignore`:
```
site/node_modules
site/public
site/.cache
```


## Usage

### Develop
```sh
make init proj_path_orig=../your-project/site
make gatsby_develop
```

### Stage

In other words, build and serve:
```sh
make gatsby_stage
```

### Build

Builds production ready site into `./site/public`:
```sh
make gatsby_build
```

### Run arbitary command inside the container
```sh
make docker_run cmd=<YOUR-COMMAND-HERE>
```

For example to install a new NPM-module:
```sh
make docker_run cmd=yarn add gatsby-transformer-yaml
```
