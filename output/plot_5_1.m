function [ ] = plot_5_1( datastruct )
%PLOT_5_1_ICC Summary of this function goes here
%   Detailed explanation goes here

GCC_decider = datastruct.assignment_id == 516;

GCC_time = datastruct.time(GCC_decider);
GCC_FOM = datastruct.FOM_line(GCC_decider);
GCC_grind = datastruct.grind_time_line(GCC_decider);
GCC_threads = datastruct.num_threads(GCC_decider);

GCC_threads_unique = unique(GCC_threads);
GCC_mean_time = zeros(size(GCC_threads_unique));
GCC_mean_FOM = zeros(size(GCC_threads_unique));
GCC_mean_grind = zeros(size(GCC_threads_unique));

ICC_decider = datastruct.assignment_id == 518;

ICC_time = datastruct.time(ICC_decider);
ICC_FOM = datastruct.FOM_line(ICC_decider);
ICC_grind = datastruct.grind_time_line(ICC_decider);
ICC_threads = datastruct.num_threads(ICC_decider);

ICC_threads_unique = unique(ICC_threads);
ICC_mean_time = zeros(size(ICC_threads_unique));
ICC_mean_FOM = zeros(size(ICC_threads_unique));
ICC_mean_grind = zeros(size(ICC_threads_unique));

for i = 1:numel(GCC_threads_unique)
    GCC_num_threads = GCC_threads_unique(i);
    GCC_mean_time(i) = mean(GCC_time(GCC_threads == GCC_num_threads));
    GCC_mean_FOM(i) = mean(GCC_FOM(GCC_threads == GCC_num_threads));
    GCC_mean_grind(i) = mean(GCC_grind(GCC_threads == GCC_num_threads));
end

for i = 1:numel(ICC_threads_unique)
    ICC_num_threads = ICC_threads_unique(i);
    ICC_mean_time(i) = mean(ICC_time(ICC_threads == ICC_num_threads));
    ICC_mean_FOM(i) = mean(ICC_FOM(ICC_threads == ICC_num_threads));  
    ICC_mean_grind(i) = mean(ICC_grind(ICC_threads == ICC_num_threads));
end

figure(1)
subplot(1,3,3)
hold on    
    GCC_h_FOM=plot(GCC_threads_unique, GCC_mean_FOM, 'r*-');
    ICC_h_FOM=plot(ICC_threads_unique, ICC_mean_FOM, 'b*-'); 
    
    xlabel('# threads')
    ylabel('FOM')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([1,16])        
    %linear function for comparison
    plot(GCC_threads_unique, GCC_mean_FOM(1)*GCC_threads_unique, 'k--');     
    
    hl_FOM = legend([GCC_h_FOM,ICC_h_FOM],'GCC FOM','ICC FOM');
    set(hl_FOM,'location','southoutside');
hold off    

subplot(1,3,1)
hold on
    GCC_h_time = plot(GCC_threads_unique, 1./GCC_mean_time, 'rx-');
    ICC_h_time = plot(GCC_threads_unique, 1./ICC_mean_time, 'bx-');
    
    xlabel('# threads')
    ylabel('1/time')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([1,16])        
    %linear function for comparison
    plot(GCC_threads_unique, 1./GCC_mean_time(1)*GCC_threads_unique, 'k--');  
        
    hl_time = legend([GCC_h_time,ICC_h_time],'GCC 1/time','ICC 1/time');
    set(hl_time,'location','southoutside');
hold off    

subplot(1,3,2)
hold on
    GCC_h_grind = plot(GCC_threads_unique, 1./GCC_mean_grind, 'ro-');        
    ICC_h_grind = plot(GCC_threads_unique, 1./ICC_mean_grind, 'bo-');
    
    xlabel('# threads')    
    ylabel('1/grind')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([1,16])        
    %linear function for comparison
    plot(GCC_threads_unique, 1./GCC_mean_grind(1)*GCC_threads_unique, 'k--');   
        
    hl_grind = legend([GCC_h_grind,ICC_h_grind],'GCC 1/grind','ICC 1/grind');
    set(hl_grind,'location','southoutside');
    
    title('OMP scaling')    
    
hold off

end

