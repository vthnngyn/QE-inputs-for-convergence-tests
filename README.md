# Quickly Making QE Inputs for Convergence Tests 

A bash script that quickly makes Quantum Espresso input files (.in) for convergence tests by making input files with varying values for a selected parameter (typically kinetic energy cutoff or k-point sampling).

## Table of Contents
* [Introduction](#introduction)
* [General Info](#general-info)
* [Technologies](#technologies)
* [Launch](#launch)
* [Example of Use](#example-of-use)

### Introduction

Using Quantum Espresso (QE), planewave DFT calculations are usually performed with preceding convergence tests to make sure appriopiate parameters are selected. These tests usually consist of multiple calculations where a parameter is increased until a selected metric converges within a chosen threshold. These calculations' input files are identical except for the chosen parameter. The script creates all the required inputs for the convergence test with a range of desired values in which it then goes on to submit them to HPC in a organized manner.  

### General Info

The script quickly makes QE .in files with inputted values for a certain convergence parameter such as kinetic energy cutoff, k-points, value for gaussian smearing, etc. The values for the selected parameter will be taken to make a .in file for each one while naming it accordingly. The script will then make a corresponding slurm file (run.uni included here is an example slurm file) and then put the input & slurm into a coressponding directory where it will then be submitted. An example input file is provided as sample.in.  

### Technologies
* Bash

### Launch

```
$ bash input.sh
```

### Example of Use
Using the provide sample files, the values for the variable will be asked for, in which here some example values are shown:
```
Prefix in QE input should be set to prefix='yyyy'
Variable to be varied shoud be set to xxxx i.e. ecutwfc='xxxx'
Enter values for selected variables, space between each value and enter to end:
7 69 420
```
The script will proceed with a normal termination example shown here:
```
Entered values: 7 69 420
Creating sample_7.in
Creating sample_69.in
Creating sample_420.in
Reading Template
Creating sample_420.uni
Creating sample_69.uni
Creating sample_7.uni
Creating sample.uni
Submiting ./input.sh.uni
Submiting ./run.uni
Submitted batch job 10728049
Submiting ./sample.uni
Submitted batch job 10728050
Submiting ./sample_420.uni
Submitted batch job 10728051
Submiting ./sample_69.uni
Submitted batch job 10728052
Submiting ./sample_7.uni
Restoring initial files
```
This should be performed in a directory with the following:
```
input.sh  run.uni  sample.in
```
The directory should contain the following after running input.sh
```
input.sh  run.uni  sample_420  sample_69  sample_7  sample.in

```



