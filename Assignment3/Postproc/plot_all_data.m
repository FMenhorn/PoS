function [] = plot_all_data(ROOTPATH, figuretitle)
    datastruct = all_csv_to_mat(ROOTPATH);
    
    [x1,y1]=get_mean_data(datastruct.size,datastruct.computation_time);
    [x2,y2]=get_mean_data(datastruct.size,datastruct.MPI_time);    

	yref1 = y1(1)/x1(1).^3 * x1.^3;
    yref2 = y2(1)/x2(1).^2 * x2.^2;

    figure(1)    
    set(gcf,'OuterPosition',[0 0 800 600])
    hold on
    plot(x1,y1,'bo-',x2,y2,'rx-')    
	plot(x1,yref1,'g--')      
    plot(x2,yref2,'k--')  
    legend('computation time','MPI time','O(n^3)','O(n^2)','Location','southoutside')
    set(gca,'xScale','log')
    set(gca,'yScale','log')
    xlabel('problem size')
    ylabel('time in seconds')
    ylim([10^-6,10^1])
	title(figuretitle)
    TheLogTicks=x1;
    set(gca,'XTick',TheLogTicks)
    hold off
end   
