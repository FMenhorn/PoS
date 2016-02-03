function [ ] = plot_comparison_io(idx)
%PLOT_COMPARISON Summary of this function goes here
%   Detailed explanation goes here

PROCTYPESHORT='hw';
%PROCTYPESHORT='sb';

PATH1 = ['../Task1/output_',PROCTYPESHORT,'/'];
data_1=all_csv_to_mat(PATH1);
PATH2 = ['../Task2/output_',PROCTYPESHORT,'/'];
data_2=all_csv_to_mat(PATH2);
PATH3 = ['../Task3/output_',PROCTYPESHORT,'/'];
data_3=all_csv_to_mat(PATH3);

[x_1_io,y_1_io]=get_mean_data(data_1.size,data_1.total_IO_time);
[x_2_io,y_2_io]=get_mean_data(data_2.size,data_2.total_IO_time);
[x_3_io,y_3_io]=get_mean_data(data_3.size,data_3.total_IO_time);

[x_1_su,y_1_su]=get_mean_data(data_1.size,data_1.reading_time+data_1.scattering_time+data_1.dimensions_time);
[x_2_su,y_2_su]=get_mean_data(data_2.size,data_2.reading_time+data_2.scattering_time+data_2.dimensions_time);
[x_3_su,y_3_su]=get_mean_data(data_3.size,data_3.reading_time+data_3.scattering_time+data_3.dimensions_time);

[x_1_td,y_1_td]=get_mean_data(data_1.size,data_1.gathering_time+data_1.writing_time);
[x_2_td,y_2_td]=get_mean_data(data_2.size,data_2.gathering_time+data_2.writing_time);
[x_3_td,y_3_td]=get_mean_data(data_3.size,data_3.gathering_time+data_3.writing_time);

[x_1_tot,y_1_tot]=get_mean_data(data_1.size,data_1.total_non_computational_mpi_time+data_1.total_IO_time+data_1.computation_time+data_1.mpi_time);
[x_2_tot,y_2_tot]=get_mean_data(data_2.size,data_2.total_non_computational_mpi_time+data_2.total_IO_time+data_2.computation_time+data_2.mpi_time);
[x_3_tot,y_3_tot]=get_mean_data(data_3.size,data_3.total_non_computational_mpi_time+data_3.total_IO_time+data_3.computation_time+data_3.mpi_time);

PROCTYPEFULL = 'Haswell';
%PROCTYPEFULL = 'Sandybridge';
  
if idx == 1
figure(1)
hold on

plot(x_1_io,y_1_io,'ko:',x_2_io,y_2_io,'bo-',x_3_io,y_3_io,'ro-')

set(gca,'xScale','log')
set(gca,'yScale','log')
xlabel('problem size')
ylabel('time in seconds')
ylim([10^-3,10^1])
xlim([64,4096])
title(['comparison of total IO time on ',PROCTYPEFULL])
legend('baseline IO time','collective IO time','MPI-IO IO time',...
       'Location','southoutside')
TheLogTicks=x_1_io;
set(gca,'XTick',TheLogTicks)

hold off

else if idx == 2  
figure(1)
hold on

plot(x_1_su,y_1_su,'kx:',x_2_su,y_2_su,'bx-',x_3_su,y_3_su,'rx-')

set(gca,'xScale','log')
set(gca,'yScale','log')
xlabel('problem size')
ylabel('time in seconds')
ylim([10^-3,10^1])
xlim([64,4096])
title(['comparison of total setup time on ',PROCTYPEFULL])
legend('baseline setup time','collective setup time','MPI-IO setup time',...
       'Location','southoutside')  
TheLogTicks=x_1_su;
set(gca,'XTick',TheLogTicks)

hold off

else if idx == 3
figure(1)
hold on

plot(x_1_td,y_1_td,'k*:',x_2_td,y_2_td,'b*-',x_3_td,y_3_td,'r*-')

set(gca,'xScale','log')
set(gca,'yScale','log')
xlabel('problem size')
ylabel('time in seconds')
ylim([10^-5,10^1])
xlim([64,4096])
title(['comparison of total teardown time on ',PROCTYPEFULL])
legend('baseline teardown time','collective teardown time','MPI-IO teardown time',...
       'Location','southoutside')   
TheLogTicks=x_1_td;
set(gca,'XTick',TheLogTicks)

hold off 

else if idx == 4
figure(1)
hold on

plot(x_1_tot,y_1_tot,'ks:',x_2_tot,y_2_tot,'bs-',x_3_tot,y_3_tot,'rs-')

set(gca,'xScale','log')
set(gca,'yScale','log')
xlabel('problem size')
ylabel('time in seconds')
ylim([10^-3,10^1])
xlim([64,4096])
title(['comparison of total time on ',PROCTYPEFULL])
legend('total time','collective time','MPI-IO time',...
       'Location','southoutside')   
TheLogTicks=x_1_td;
set(gca,'XTick',TheLogTicks)

hold off 

end
end
end
end



end

