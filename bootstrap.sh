#!/bin/bash

if [ -d ".venv" ]; then
  rm -r .venv
fi
"$(brew --prefix python@3.11)"/bin/python3.11 -m venv .venv && source .venv/bin/activate
pip3 install -e .

cd ./chainforge/react-server || exit
if [ -d "node_modules" ]; then
  rm -r node_modules
fi
bun install
bun run build
