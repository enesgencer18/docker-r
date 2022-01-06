#!/bin/bash

echo "doing cool stuff"

COPY test_import.R /tests/test_import.R

CMD R -e "source('/home/analysis/test_import.R')"
