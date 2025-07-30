#!/usr/bin/env bash

docker build -t latex .
docker run --rm -i -v "$PWD":/data latex pdflatex roland_lopez_resume.tex
