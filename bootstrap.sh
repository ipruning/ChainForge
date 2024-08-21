#!/bin/bash

if [ -d ".venv" ]; then
  rm -r .venv
fi

"$(brew --prefix python@3.12)"/bin/python3.12 -m venv .venv && source .venv/bin/activate
.venv/bin/pip install -e .

cd ./chainforge/react-server || exit

if [ -d "node_modules" ]; then
  rm -r node_modules
fi

if [ -d "build" ]; then
  rm -r build
fi

bun install
bun run build

cd ../..

if docker build -t chainforge .; then
  echo "Docker image built successfully"
  docker run -p 8000:8000 chainforge
else
  echo "Docker image build failed"
fi
