function [ h_FOM ] = plot_5_3_HYBRID( datastruct )
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
mean_FOM = struct();
mean_grind = struct();
mean_time = struct();
for i = 1:numel(procs_unique)
    procs = procs_unique(i);
    key = ['p',num2str(procs)];
    mean_FOM.(key) = [];
    mean_grind.(key) = [];
    mean_time.(key) = [];
    num_threads.(key) = [];
    num_procs.(key) = procs;
    for j = 1:numel(threads_unique)        
        threads = threads_unique(j);
        num_threads.(key) = [num_threads.(key),threads];
        mean_FOM.(key) = [mean_FOM.(key),mean(FOM(and((proc == procs),(thread == threads))))];                       
        mean_grind.(key) = [mean_grind.(key),mean(grind(and((proc == procs),(thread == threads))))];
        mean_time.(key) = [mean_time.(key),mean(time(and((proc == procs),(thread == threads))))];
    end
end

figure(3)
hold on
subplot(1,3,3)
hold on
FOM_str_xlabel = 'total #threads';
xlabel(FOM_str_xlabel)
ylabel('FOM') 
set(gca,'xScale','log')
set(gca,'yScale','log')
color = {'r*-','b*-'};
legendentries_FOM = {'1 processor','8 processors',['O(',FOM_str_xlabel,')']};
legendhandles_FOM = [0,0,0];
XlogTicks=0:1:4;
LogTicks=2.^XlogTicks;
TheLogTicks=LogTicks;
set(gca,'XTick',TheLogTicks)
xlim([1,16]) 
for i = 1:numel(procs_unique)
    procs = procs_unique(i);
    key = ['p',num2str(procs)];
    this_threads = num_threads.(key);
    this_mean_FOM = mean_FOM.(key);
    this_num_cores = procs * this_threads;                                     
    h_FOM = plot(this_num_cores, this_mean_FOM,color{i}); 
    h_REF_FOM = plot(this_num_cores, this_num_cores*this_mean_FOM(1)/this_num_cores(1),'k--');
    legendhandles_FOM(i) = h_FOM;            
    legendhandles_FOM(3) = h_REF_FOM;
end

lh_FOM = legend(legendhandles_FOM,legendentries_FOM);
set(lh_FOM,'location','southoutside');

hold off


subplot(1,3,2)
hold on
title('HYBRID scaling')
grind_str_xlabel = '#threads per mpi process';
xlabel(grind_str_xlabel)
ylabel('1/grindtime') 
set(gca,'xScale','log')
set(gca,'yScale','log')
color = {'ro-','bo-'};
legendentries_grind = {'1 processor','8 processors',['O(',grind_str_xlabel,')']};
legendhandles_grind = [0,0,0];
XlogTicks=0:1:4;
LogTicks=2.^XlogTicks;
TheLogTicks=LogTicks;
set(gca,'XTick',TheLogTicks)
xlim([1,16]) 

for i = 1:numel(procs_unique)
    procs = procs_unique(i);
    key = ['p',num2str(procs)];
    this_threads = num_threads.(key);
    this_mean_grind = mean_grind.(key);
    this_num_cores = procs * this_threads;                                     
    h_grind = plot(this_threads, 1./this_mean_grind,color{i});            
    h_REF_grind = plot(this_threads, this_threads/this_mean_grind(1)/this_threads(1),'k--');
    legendhandles_grind(i) = h_grind;            
    legendhandles_grind(3) = h_REF_grind; 
end

lh_grind = legend(legendhandles_grind,legendentries_grind);
set(lh_grind,'location','southoutside');

hold off


subplot(1,3,1)
hold on
time_str_xlabel = 'total #threads';
xlabel(time_str_xlabel)
ylabel('1/time') 
set(gca,'xScale','log')
set(gca,'yScale','log')
color = {'rx-','bx-'};
legendentries_time = {'1 processor','8 processors',['O(',time_str_xlabel,')']};
legendhandles_time = [0,0,0];
XlogTicks=0:1:4;
LogTicks=2.^XlogTicks;
TheLogTicks=LogTicks;
set(gca,'XTick',TheLogTicks)
xlim([0,16]) 

for i = 1:numel(procs_unique)
    procs = procs_unique(i);
    key = ['p',num2str(procs)];
    this_threads = num_threads.(key);
    this_mean_time = mean_time.(key);
    this_num_cores = procs * this_threads;                                     
    h_time = plot(this_num_cores, 1./this_mean_time,color{i});            
    h_REF_time = plot(this_num_cores, this_num_cores/this_mean_time(1)/this_num_cores(1),'k--');
    legendhandles_time(i) = h_time;            
    legendhandles_time(3) = h_REF_time;  
end

lh_time = legend(legendhandles_time,legendentries_time);
set(lh_time,'location','southoutside');

hold off
hold off
end

