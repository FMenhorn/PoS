#!/bin/bash
matlab -nodisplay -nosplash -r "plot_comparison_io(4);saveas(gcf,'$1');clf;quit"
pdfcrop --margins '5 5 5 5' $1 $1
