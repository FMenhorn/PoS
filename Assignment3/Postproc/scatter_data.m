function [] = scatter_data(ROOTPATH, figuretitle)
    datastruct = all_csv_to_mat(ROOTPATH);

    x = sort(unique(datastruct.size));
    y1 = zeros(numel(x),1);
    y2 = zeros(numel(x),1);
    e1 = zeros(numel(x),1);
    e2 = zeros(numel(x),1);
    n = zeros(numel(x),1);

    %calculate mean
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
    
    %calculate variance
    for i = 1:numel(datastruct.size)
        j = x==datastruct.size(i);
        e1(j) = e1(j) + (datastruct.computation_time(i) - y1(j))^2;
        e2(j) = e2(j) + (datastruct.MPI_time(i) - y2(j))^2;                
    end
    for i = 1:numel(x)
        e1(i) = sqrt(e1(i)/(n(i)-1));
        e2(i) = sqrt(e2(i)/(n(i)-1));
    end

	yref1 = y1(1)/x(1).^3 * x.^3;
    yref2 = y2(1)/x(1).^2 * x.^2;

    figure(1)
    set(gcf,'OuterPosition',[0 0 800 600])
    hold on
    plot(x,y1,'bo',x,y2,'rx')      
	plot(x,yref1,'g--')      
    plot(x,yref2,'k--')  
    legend('computation time','MPI time','O(n^3)','O(n^2)','Location','southoutside') 
    plot(datastruct.size,datastruct.computation_time,'b.',datastruct.size,datastruct.MPI_time,'r.')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    xlabel('problem size')
    ylabel('time in seconds')
    ylim([10^-6,10^1])
	title(figuretitle)
    TheLogTicks=x;
    set(gca,'XTick',TheLogTicks)
    hold off
end   
