#!/bin/bash
matlab -nodisplay -nosplash -r "plot_vs_baseline('$1');saveas(gcf,'$2');clf;quit"
pdfcrop --margins '5 5 5 5' $2 $2
