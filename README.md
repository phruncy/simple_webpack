# simple_webpack

A little helper script to set up a basic javascript web application.
Generates A simple node project with webpack and several webpack plugins.

## Installation

-   Give the script execution rights
    ```
    chmod 755 ./simpleweb.sh
    ```
-   Create a symlink in a directory that is on the Path (e. g. `usr/local/bin`)
    ```
    ln -s /path/to/repo/simple_webpack/simpleweb.sh /usr/local/bin/simpleweb
    ```

## How to use

To create a new project, type

```
simpleweb <project_name>
```

If the name option is omitted, a default name will be given.

## What it does

-   Creates a package.json with scriptt to build the poject and run a dev server with webpack
-   Creates a basic webpack configuration file
-   The following folder structure is created:

```
    project_root
    |- package.json
    |- package-lock.json
    |- webpack.config.js
    |- /dist
    |- /node_modules
    |- /src
        |- index.js
```
