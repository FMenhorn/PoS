all_csv_to_mat;

x = sort(unique(datastruct.size));
y1 = zeros(numel(x),1);
y2 = zeros(numel(x),1);
n = zeros(numel(x),1);

for i = 1:numel(datastruct.size)
    j = x==datastruct.size(i);
    y1(j) = y1(j) + datastruct.computation_time(i);
    y2(j) = y2(j) + datastruct.MPI_time(i);
    n(j) = n(j)+1;
end

for i = 1:numel(x)
    y1(i) = y1(i)/n(i);
    y2(i) = y2(i)/n(i);
end

figure(1)
hold on
plot(x,y1,x,y2)
legend('computation time','MPI time')
set(gca,'xScale','log')
set(gca,'yScale','log')
xlabel('problem size')
TheLogTicks=x;
set(gca,'XTick',TheLogTicks)
hold off