function [] = plot_all_data(ROOTPATH, figuretitle)
    datastruct = all_csv_to_mat(ROOTPATH);

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

	yref = y1(1)/x(1).^3 * x.^3;

    figure(1)
    hold on
    plot(x,y1,'o-',x,y2,'x-')
	plot(x,yref,'--')
    legend('computation time','MPI time','O(n^3)','Location','southoutside')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    xlabel('problem size')
    ylabel('time in seconds')
	title(figuretitle)
    TheLogTicks=x;
    set(gca,'XTick',TheLogTicks)
    hold off
end   
