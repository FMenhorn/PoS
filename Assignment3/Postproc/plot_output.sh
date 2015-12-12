#!/bin/bash
#matlab -r -nodisplay "plot_all_data('../Task3/output_sb/'); quit"
matlab -nodisplay -nosplash -r "plot_all_data('$1','$2');saveas(gcf,'$3');quit"

