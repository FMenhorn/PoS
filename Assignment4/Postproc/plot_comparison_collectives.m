function [ ] = plot_comparison_collectives( )
%PLOT_COMPARISON Summary of this function goes here
%   Detailed explanation goes here

PROCTYPESHORT='hw';
%PROCTYPESHORT='sb';

PATH1 = ['../Task1/output_',PROCTYPESHORT,'/'];
data_1=all_csv_to_mat(PATH1);
PATH2 = ['../Task2/output_',PROCTYPESHORT,'/'];
data_2=all_csv_to_mat(PATH2);

[x_1dim,y_1dim]=get_mean_data(data_1.size,data_1.dimensions_time);
[x_2dim,y_2dim]=get_mean_data(data_2.size,data_2.dimensions_time);
[x_1sca,y_1sca]=get_mean_data(data_1.size,data_1.scattering_time);
[x_2sca,y_2sca]=get_mean_data(data_2.size,data_2.scattering_time);
[x_1gat,y_1gat]=get_mean_data(data_1.size,data_1.gathering_time);
[x_2gat,y_2gat]=get_mean_data(data_2.size,data_2.gathering_time);

PROCTYPEFULL = 'Haswell';
%PROCTYPEFULL = 'Sandybridge';
  
figure(1)
hold on

plot(x_1dim,y_1dim,'bo:',x_2dim,y_2dim,'bo-')
plot(x_1sca,y_1sca,'r*:',x_2sca,y_2sca,'r*-')
plot(x_1gat,y_1gat,'gx:',x_2gat,y_2gat,'gx-')

set(gca,'xScale','log')
set(gca,'yScale','log')
xlabel('problem size')
ylabel('time in seconds')
ylim([10^-6,10^1])
xlim([64,4096])
title(['comparison with and without collectives ',PROCTYPEFULL])
legend('baseline w/o MPI\_Broadcast','collective w MPI\_Broadcast',...
    'baseline w/o MPI\_Scatterv','collective w MPI\_Scatterv',...
    'baseline w/o MPI\_Gather','collective w MPI\_Gather',...
    'Location','southoutside')
TheLogTicks=x_1dim;
set(gca,'XTick',TheLogTicks)

hold off




end

