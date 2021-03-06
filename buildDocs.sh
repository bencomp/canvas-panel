#!/usr/bin/env bash
# Clean up previous build
rm -rf ./dist

# Build everything.
yarn run build || { echo '@canvas-panel failed to build' ; exit 1; }

# Build cookbook example site (base)
yarn run build-cookbook || { echo 'Cookbook failed to build' ; exit 1; }
mv ./packages/canvas-panel-cookbook/dist .

# Build documentation
yarn run build-docs || { echo 'Styleguide failed to build' ; exit 1; }
mv ./packages/canvas-panel-core/styleguide ./dist
