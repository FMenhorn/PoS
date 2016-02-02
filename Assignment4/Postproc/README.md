#Postprocessing of data

run these MATLAB scripts for postprocessing of the results. Give the path to the folder containing the output to ```plot_all_data```.

use for example in MATLAB:
```
plot_all_data('../Task3/output_sb/')
plot_all_data('../Task3/output_hw/')
```

or from bash:
```
./plot_output.sh ../Task3/output_sb/ 'Blocking Send/Recv Communication on Sandybridge' blockingSB.pdf
```

if you want to generate the output for all tasks, run the respective shell script:
```
Task*createPlots.sh
```
Take care that the ```.csv``` output is located in ```../Task*/output*```. Take a look at the ```.sh``` files, if you don't know which output is expected.
