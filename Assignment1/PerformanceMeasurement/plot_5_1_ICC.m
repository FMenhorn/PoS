function [ ICC_h ] = plot_5_1_ICC( datastruct )
%PLOT_5_1_ICC Summary of this function goes here
%   Detailed explanation goes here

ICC_decider = datastruct.assignment_id == 518;

ICC_time = datastruct.time(ICC_decider);
ICC_FOM = datastruct.FOM_line(ICC_decider);
ICC_threads = datastruct.num_threads(ICC_decider);

ICC_threads_unique = unique(ICC_threads);
ICC_mean_time = zeros(size(ICC_threads_unique));
ICC_mean_FOM = zeros(size(ICC_threads_unique));
for i = 1:numel(ICC_threads_unique)
    ICC_num_threads = ICC_threads_unique(i);
    ICC_mean_time(i) = mean(ICC_time(ICC_threads == ICC_num_threads));
    ICC_mean_FOM(i) = mean(ICC_FOM(ICC_threads == ICC_num_threads));    
end

figure(1)
hold on
    %h=plot(threads_unique, 1./mean_time, 'b*-');
    ICC_h=plot(ICC_threads_unique, ICC_mean_FOM, 'b*-');   
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
hold off

end

