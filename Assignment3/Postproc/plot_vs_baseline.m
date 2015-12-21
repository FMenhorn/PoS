function [ ] = plot_comparison( PROCTYPE )
%PLOT_COMPARISON Summary of this function goes here
%   Detailed explanation goes here

PATH3 = ['../Task3/output_',PROCTYPE,'/'];
data_3=all_csv_to_mat(PATH3);
PATH4 = ['../Task4/output_',PROCTYPE,'/'];
data_4=all_csv_to_mat(PATH4);
PATH4P = ['../Task4/output_',PROCTYPE,'_probe/'];
data_4p=all_csv_to_mat(PATH4P);
PATH5 = ['../Task5/output_',PROCTYPE,'/'];
data_5=all_csv_to_mat(PATH5);

[x_3,y_3]=get_mean_data(data_3.size,data_3.MPI_time);
[x_4,y_4]=get_mean_data(data_4.size,data_4.MPI_time);
[x_4p,y_4p]=get_mean_data(data_4p.size,data_4p.MPI_time);
[x_5,y_5]=get_mean_data(data_5.size,data_5.MPI_time);

if(strcmp(PROCTYPE,'hw'))
    PROCTYPEFULL = 'Haswell';
elseif(strcmp(PROCTYPE,'sb'))
    PROCTYPEFULL = 'Sandybridge';
else
    disp ERROR!!!
end
    

figure(1)
hold on

plot(x_3,y_3./y_3,'rx--',x_4,y_3./y_4,'bx-',x_4p,y_3./y_4p,'bo-',x_5,y_3./y_5,'gx-')

set(gca,'xScale','log')
%set(gca,'yScale','log')
xlabel('problem size')
ylabel('speedup')
%ylim([10^-3,10^1])
ylim([0,10])
title(['comparison of speedup wrt. baseline on ',PROCTYPEFULL])
legend('baseline','Isend/Irecv','Isend/Irecv with probing','DMA','Location','southoutside')
TheLogTicks=x_3;
set(gca,'XTick',TheLogTicks)

hold off




end

