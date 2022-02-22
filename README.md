# Bash Script for Making QE Convergence Test Inputs

input.sh is a bash script to quickly making QE .in files with inputted values for a certain convergence parameter such as kinetic energy cutoff, k-points, value for gaussian smearing, etc.

input.sh will take values for the selected parameter and make a .in file for each one while naming it accordingly. The script will then make a corresponding slurm file (run.uni included here is an example slurm file) and then put the input and the slurm into a coressponding directory where it will then be submitted. 

sample.in is an example input file. 
