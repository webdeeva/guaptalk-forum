#!/bin/bash
echo "Node version: $(node --version || echo 'Node not found')"
echo "NPM version: $(npm --version || echo 'NPM not found')"
echo "Building NodeBB..."
npm run build
echo "Starting NodeBB..."
node loader.js