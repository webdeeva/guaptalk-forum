#!/bin/bash
echo "Building NodeBB..."
./nodebb build
echo "Starting NodeBB..."
node loader.js