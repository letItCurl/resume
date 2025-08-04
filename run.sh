#!/usr/bin/env bash

IMAGE_NAME="latex"

# Check if Docker image exists
if docker image inspect "$IMAGE_NAME" > /dev/null 2>&1; then
  echo "✅ Docker image '$IMAGE_NAME' already exists — skipping build."
else
  echo "📦 Building Docker image '$IMAGE_NAME'..."
  docker build -t "$IMAGE_NAME" .
fi

echo "📄 Compiling LaTeX file..."
docker run --rm -i -v "$PWD":/data "$IMAGE_NAME" pdflatex roland_lopez_resume.tex