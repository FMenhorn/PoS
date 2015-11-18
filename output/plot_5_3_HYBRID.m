function [ h ] = plot_5_3_HYBRID( datastruct )
%PLOT_5_1_ICC Summary of this function goes here
%   Detailed explanation goes here

decider = datastruct.assignment_id == 53;

grind = datastruct.grind_time_line(decider);
time = datastruct.time(decider);
FOM = datastruct.FOM_line(decider);
proc = datastruct.num_cpu(decider);
thread = datastruct.num_threads(decider);

procs_unique = unique(proc);
threads_unique = unique(thread);
mean_FOM = zeros(numel(procs_unique),numel(threads_unique));
mean_grind = zeros(numel(procs_unique),numel(threads_unique));
mean_time = zeros(numel(procs_unique),numel(threads_unique));
for i = 1:numel(procs_unique)
    for j = 1:numel(threads_unique)
        num_procs = procs_unique(i);
        num_threads = threads_unique(j);        
        mean_FOM(i,j) = mean(FOM(and((proc == num_procs),(thread == num_threads))));
        mean_grind(i,j) = mean(grind(and((proc == num_procs),(thread == num_threads))));
        mean_time(i,j) = mean(time(and((proc == num_procs),(thread == num_threads))));
    end
end

figure(3)
hold on
subplot(1,3,1)
hold on
xlabel('no cores')
ylabel('FOM') 
set(gca,'xScale','log')
set(gca,'yScale','log')
color = {'r*-','b*-'};
legendentries = {'1 processor','8 processors'};
legendhandles = [0,0];
XlogTicks=0:1:4;
LogTicks=2.^XlogTicks;
TheLogTicks=LogTicks;
set(gca,'XTick',TheLogTicks)
xlim([1,16]) 
for i = 1:numel(procs_unique)
    last_num_cores = 0;
    last_mean_FOM = 0;
    for j = 1:numel(threads_unique)        
        if ~isnan(mean_FOM(i,j)) && mean_FOM(i,j)~=0
            num_procs = procs_unique(i);
            num_threads = threads_unique(j);
            num_cores = num_procs * num_threads;
            mean_FOM(i,j);              
            if last_num_cores == 0
                last_num_cores = num_cores;
                last_mean_FOM = mean_FOM(i,j);
            end
            h = plot([last_num_cores,num_cores], [last_mean_FOM,mean_FOM(i,j)],color{i});            
            last_num_cores=num_cores;
            last_mean_FOM=mean_FOM(i,j);
            legendhandles(i) = h;
        end
    end    
end

lh = legend(legendhandles,legendentries);
set(lh,'location','southoutside');

hold off


subplot(1,3,2)
hold on
title('HYBRID scaling')
xlabel('no threads per processor')
ylabel('1/grindtime') 
set(gca,'xScale','log')
set(gca,'yScale','log')
color = {'r*-','b*-'};
legendentries = {'1 processor','8 processors'};
legendhandles = [0,0];
XlogTicks=0:1:4;
LogTicks=2.^XlogTicks;
TheLogTicks=LogTicks;
set(gca,'XTick',TheLogTicks)
xlim([1,16]) 
for i = 1:numel(procs_unique)
    last_num_threads = 0;
    last_mean_grind= 0;
    for j = 1:numel(threads_unique)        
        if ~isnan(mean_FOM(i,j)) && mean_FOM(i,j)~=0
            num_procs = procs_unique(i);
            num_threads = threads_unique(j);
            num_cores = num_procs * num_threads;
            mean_FOM(i,j);
            if last_num_threads == 0
                last_num_threads = num_threads;
                last_mean_grind = mean_grind(i,j);
            end            
            h = plot([last_num_threads, num_threads], [1./last_mean_grind,1./mean_grind(i,j)],color{i});
            last_num_threads=num_threads;
            last_mean_grind=mean_grind(i,j);            
            legendhandles(i) = h;
        end
    end
end

lh = legend(legendhandles,legendentries);
set(lh,'location','southoutside');

hold off


subplot(1,3,3)
hold on
xlabel('no cores')
ylabel('1/time') 
set(gca,'xScale','log')
set(gca,'yScale','log')
color = {'r*-','b*-'};
legendentries = {'1 processor','8 processors'};
legendhandles = [0,0];
XlogTicks=0:1:4;
LogTicks=2.^XlogTicks;
TheLogTicks=LogTicks;
set(gca,'XTick',TheLogTicks)
xlim([0,16]) 
for i = 1:numel(procs_unique)
    last_num_cores = 0;
    last_mean_time= 0;
    for j = 1:numel(threads_unique)        
        if ~isnan(mean_FOM(i,j)) && mean_FOM(i,j)~=0
            num_procs = procs_unique(i);
            num_threads = threads_unique(j);
            num_cores = num_procs * num_threads;
            mean_FOM(i,j);
            if last_num_cores == 0
                last_num_cores = num_cores;
                last_mean_time = mean_time(i,j);
            end  
            h = plot([last_num_cores,num_cores], [1./last_mean_time,1./mean_time(i,j)],color{i});
            last_num_cores = num_cores;
            last_mean_time = mean_time(i,j);
            legendhandles(i) = h;
        end
    end
end

lh = legend(legendhandles,legendentries);
set(lh,'location','southoutside');

hold off
hold off
end
