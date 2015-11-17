all_csv_to_mat %imports data to datastruct

hgcc = plot_5_1_GCC(datastruct);
hicc = plot_5_1_ICC(datastruct);
title('OMP scaling')
hl = legend([hgcc,hicc],'GCC','ICC');
set(hl,'location','southoutside');

plot_5_2_MPI(datastruct);
plot_5_3_HYBRID(datastruct);

