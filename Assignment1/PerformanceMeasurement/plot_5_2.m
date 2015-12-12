function [ ] = plot_5_2( datastruct )
%PLOT_5_1_ICC Summary of this function goes here
%   Detailed explanation goes here

decider = datastruct.assignment_id == 52;

time = datastruct.time(decider);
FOM = datastruct.FOM_line(decider);
grind = datastruct.grind_time_line(decider);
proc = datastruct.num_cpu(decider);

proc_unique = unique(proc);
mean_time = zeros(size(proc_unique));
mean_FOM = zeros(size(proc_unique));
mean_grind = zeros(size(proc_unique));

for i = 1:numel(proc_unique)
    num_proc = proc_unique(i);
    mean_time(i) = mean(time(proc == num_proc));
    mean_FOM(i) = mean(FOM(proc == num_proc));
    mean_grind(i) = mean(grind(proc == num_proc));
end

figure(2)
subplot(1,3,3)
hold on    
    h_FOM=plot(proc_unique, mean_FOM, 'r*-');    
    
    xlabel('#cpu')
    ylabel('FOM')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([1,8])        
    %linear function for comparison
    REF_h_FOM = plot(proc_unique, mean_FOM(1)*proc_unique, 'k--');     
    
    hl_FOM = legend([h_FOM,REF_h_FOM],'MPI FOM','O(#cpu)');
    set(hl_FOM,'location','southoutside');
hold off    

subplot(1,3,1)
hold on
    h_time = plot(proc_unique, 1./mean_time, 'rx-');    
    
    xlabel('#cpu')
    ylabel('1/time')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([1,8])    
    ylim([1./mean_time(1)/10,10*1./mean_time(1)])
    %linear function for comparison
    REF_h_time = plot(proc_unique, 1./mean_time(1)*ones(size(proc_unique)), 'k--');  
        
    hl_time = legend([h_time,REF_h_time],'MPI 1/time','O(1)');
    set(hl_time,'location','southoutside');
hold off    

subplot(1,3,2)
hold on
    h_grind = plot(proc_unique, 1./mean_grind, 'ro-');           
    
    xlabel('#cpu')    
    ylabel('1/grind')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    XlogTicks=0:1:4;
    LogTicks=2.^XlogTicks;
    TheLogTicks=LogTicks;
    set(gca,'XTick',TheLogTicks)
    xlim([1,8])
    ylim([1./mean_grind(1)/10,10*1./mean_grind(1)])
    %linear function for comparison
    REF_h_grind=plot(proc_unique, 1./mean_grind(1)*ones(size(proc_unique)), 'k--');   
        
    hl_grind = legend([h_grind,REF_h_grind],'MPI 1/grind','O(1)');
    set(hl_grind,'location','southoutside');
    
    title('MPI scaling')    
    
hold off

end

