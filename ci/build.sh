#!/bin/bash
set -e

configuration=${1:-Debug}

dotnet build ./GreetingApp.sln -c $configuration