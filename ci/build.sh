#!/bin/bash
set -e

# variables
configuration=${1:-Debug}

# build
dotnet build ./GreetingApp.sln -c $configuration