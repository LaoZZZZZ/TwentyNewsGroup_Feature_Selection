#!/bin/bash

echo "Feature Selection - Greedy - Chi Square"
nohup octave Feature_Selection_Greedy_ChiSquare.m > FSGSQ 2>&1 &
echo "Done"
