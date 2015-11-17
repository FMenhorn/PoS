function [ h ] = plot_5_1_ICC( datastruct )
%PLOT_5_1_ICC Summary of this function goes here
%   Detailed explanation goes here

decider = datastruct.assignment_id == 518;

time = datastruct.time(decider);
threads = datastruct.num_threads(decider);

threads_unique = unique(threads);
mean_time = zeros(size(threads_unique));
for i = 1:numel(threads_unique)
    num_threads = threads_unique(i);
    mean_time(i) = mean(time(threads == num_threads));
    
end

figure(1)
hold on
    h=plot(threads_unique, 1./mean_time, '*-');
    xlabel('no threads')
    ylabel('1/time')    
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([1,16])
    ylim([10^-2,10^0])
hold off

end

