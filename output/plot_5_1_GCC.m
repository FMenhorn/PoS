function [ GCC_h ] = plot_5_1_GCC( datastruct )
%PLOT_5_1_ICC Summary of this function goes here
%   Detailed explanation goes here

GCC_decider = datastruct.assignment_id == 516;

GCC_time = datastruct.time(GCC_decider);
GCC_FOM = datastruct.FOM_line(GCC_decider);
GCC_threads = datastruct.num_threads(GCC_decider);

GCC_threads_unique = unique(GCC_threads);
GCC_mean_time = zeros(size(GCC_threads_unique));
GCC_mean_FOM = zeros(size(GCC_threads_unique));
for i = 1:numel(GCC_threads_unique)
    GCC_num_threads = GCC_threads_unique(i);
    GCC_mean_time(i) = mean(GCC_time(GCC_threads == GCC_num_threads));
    GCC_mean_FOM(i) = mean(GCC_FOM(GCC_threads == GCC_num_threads));
end

figure(1)
hold on
    %h=plot(threads_unique, 1./mean_time, 'r*-');
    GCC_h=plot(GCC_threads_unique, GCC_mean_FOM, 'r*-');    
    xlabel('no threads')
    ylabel('FOM')    
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([1,16])
    %ylim([10^-2,10^0])
    plot(GCC_threads_unique, GCC_mean_FOM(1)*GCC_threads_unique, 'k--');   
hold off

end

