#! /usr/bin/bash

# Build VBPS files

cd $(pwd)

echo "Building VBPS..."
v -prod src/vbps/vbps.v
echo "Building VBPS-REPOS..."
v -prod src/vbps-repos/vbps-repos.v
echo "Building VBPS-RUNIT..."
v -prod src/vbps-runit/vbps-runit.v
echo "Building VBPS-SRC..."
v -prod src/vbps-src/vbps-src.v

echo "Moving files..."
mv src/vbps/vbps $(pwd)
mv src/vbps-repos/vbps-repos $(pwd)
mv src/vbps-runit/vbps-runit $(pwd)
mv src/vbps-src/vbps-src $(pwd)