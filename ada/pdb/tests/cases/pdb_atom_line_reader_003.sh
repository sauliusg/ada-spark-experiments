#!/bin/sh

bin/pdb_reader \
    tests/data/1knv.pdb \
    tests/data/1oel.pdb \
    - \
    tests/data/1knv.pdb \
< tests/data/1oel.pdb
