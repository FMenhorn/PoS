#!/bin/bash
#matlab -r -nodisplay "plot_all_data('../Task3/output_sb/'); quit"
matlab -nodisplay -nosplash -r "plot_all_data('$1','$2');saveas(gcf,'$3');clf;scatter_data('$1','$2');saveas(gcf,['scatter','$3']);quit"
pdfcrop --margins '5 5 5 5' "scatter$3" "scatter$3"
pdfcrop --margins '5 5 5 5' $3 $3
