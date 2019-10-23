# docker-build-and-deploy
Develop &amp; Build [GatsbyJS](https://www.gatsbyjs.org/) static sites within a [Docker](https://www.docker.com/) container. Server static website content with [Nginx Alpine](https://hub.docker.com/_/nginx) Docker container.

- 🚮  **Clutter-free host machine**: No need to install Node/Gatsby/Webpack/etc on your host machine! Only Docker required (tested on `v17.12.0`).
- 🏗  **Easy setup**: Automatic GatsbyJS site initializion with [`gatsby-starter-default`](http://gatsbyjs.github.io/gatsby-starter-default/) (unless already initialized)
- 👍  **Simple CLI API**: [`develop`/`stage`/`build`](#usage)
- 🆕  **Recent NodeJS**: Container based on NodeJS `v10.15.2` running in Ubuntu Linux 19.04
- 📃  [MIT](https://github.com/IgorMazur/gatsby-docker/blob/master/LICENSE)-licensed


## Setup

**NOTE**: Your GatsbyJS site will be created into `$GATSBY_ROOT` define in `.makerc` automatically.


## Usage

### Init

```sh
make init
# edit .makerc
make gatsby__docker_build
```

### Develop
```sh
make gatsby_develop
```

### Stage

In other words, build and serve:
```sh
make gatsby_stage
```

### Build

Builds production ready site into `$GATSBY_ROOT/public`:
```sh
make gatsby_build
```

### Run arbitary command inside the container
```sh
make gatsby__docker_run cmd=<YOUR-COMMAND-HERE>
```

For example to install a new NPM-module:
```sh
make gatsby__docker_run cmd=yarn add gatsby-transformer-yaml
```
