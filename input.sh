#!/bin/bash
#Example slurm file
STRING="run.uni"

echo Prefix in QE input should be set to prefix=$'\'yyyy'\' 
echo Variable to be varied shoud be set to xxxx i.e. ecutwfc=$'\'xxxx'\' 
echo Enter values for selected variables, space between each value and enter to end:
read -a var
echo Entered values: ${var[@]}

#Make input files for convergence tests by varying variable as inputted and naming accordingly
for w in *.in; do
	template="${w%.*}.in"
	varble="xxxx"
        prefix="yyyy"	
	for val in "${var[@]}"; do
                temp="${w%.*}_${val}.temp"
  		inp="${w%.*}_${val}.in"
  		sed "s/$varble/$val/g" $template > $temp
                sed "s/$prefix/${w%.*}_$val/" $temp > $inp
		rm *.temp
                echo Creating "$inp"
		done
done

#Make corresponding slurm files
for j in *.in; do
	cp run.uni ${j%.*}.uni
	done
for x in *.uni; do
	if [[ "$STRING" == "$x" ]];
	then
		echo "Reading Template"
	else
        	sed -i "s/temp/${x%.*}/g" $x
		echo Creating "$x"
	fi
	done

#Put corresponding input and slurm files into coressponding directory
for i in ./*.in; do
        mkdir "${i%.*}" && mv "$i" "${i%.*}"
        done
for y in ./*.uni; do
        mv "$y" "${y%.*}"
        done

#Submit all slurm files
for D in ./*; do
        [ -d "$D" ] && cd $D && sbatch *.uni && cd ../
        echo Submiting "$D".uni
        done

#Clean up
cp "${w%.*}"/"${w%.*}.in" ./
rm -r "${w%.*}"
mv run run.uni
echo Restoring initial files

