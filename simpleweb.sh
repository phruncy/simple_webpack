#!/bin/sh

create_package(){
    npm init -y
    npm pkg set scripts.build="webpack"
    npm pkg set scripts.serve="webpack serve --open"
    npm install -D webpack webpack-cli webpack-dev-server html-webpack-plugin
    npm install -D style-loader css-loader
} 

create_boilerplate(){
    mkdir src dist
    local SCRIPT_BASEDIR=$(dirname "$SCRIPT_PATH")
    cp ${SCRIPT_BASEDIR}/templates/webpack.config.js .
    cp ${SCRIPT_BASEDIR}/templates/index.js ./src
}

SCRIPT_PATH=$(realpath "$0")
PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME="new_project"
    read -p "Enter project name (default: ${PROJECT_NAME}): " USER_INPUT
    if ! [ -z "$USER_INPUT" ]; then
        PROJECT_NAME=$USER_INPUT
    fi
fi

if [ -d $PROJECT_NAME ]; then
    >&2 echo "> Error: The folder '${PROJECT_NAME}' already exists in the current directory. No project was created."
    exit 1
fi
echo "Creating new project ${PROJECT_NAME}..."
mkdir $PROJECT_NAME
pushd $PROJECT_NAME > /dev/null
    create_package
    create_boilerplate
popd > /dev/null
echo "\n Project generation finished."