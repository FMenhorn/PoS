function [ x,y ] = get_mean_data( x_in,y_in )
%GET_MEAN_DATA Summary of this function goes here
%   Detailed explanation goes here

x = sort(unique(x_in));
y = zeros(numel(x),1);
n = zeros(numel(x),1);

%calculate mean
for i = 1:numel(x_in)
    j = x==x_in(i);
    y(j) = y(j) + y_in(i);    
    n(j) = n(j)+1;
end

y = y./n;



end

