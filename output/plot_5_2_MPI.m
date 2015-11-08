function [ h ] = plot_5_2_MPI( datastruct )
%PLOT_5_1_ICC Summary of this function goes here
%   Detailed explanation goes here

decider = datastruct.assignment_id == 52;

time = datastruct.time(decider);
proc = datastruct.num_cpu(decider);

procs_unique = unique(proc);
mean_time = zeros(size(procs_unique));
for i = 1:numel(procs_unique)
    num_procs = procs_unique(i);
    mean_time(i) = mean(time(proc == num_procs));
    
end

figure(1)
hold on
    h=plot(procs_unique, 1./mean_time, '*');
    xlabel('no cpus')
    ylabel('1/time')    
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([0,16]) 
    ylim([0,1])
hold off

end

