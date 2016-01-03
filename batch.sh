#!/bin/bash

echo "maching learning project"
nohup screen nice matlab -nodesktop -nojvm print.m > hello 2>&1 &
