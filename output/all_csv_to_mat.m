
my_structs = dir('*.csv');

N_data = numel(my_structs);
names = cell(N_data,1);
for i = 1:numel(my_structs)
names{i} = my_structs(i).name;
end

data = zeros(N_data,9);

for i = 1:N_data
data(i,:) = dlmread(names{i},';');

end

columnnames = { 'job_id',...
                'assignment_id',...
                'num_cpu',...
                'num_threads',...
                'time',...
                'grind_time_line',...
                'FOM_line'};

datastruct = struct();
for i = 1:7
    datastruct.(columnnames{i}) = data(:,i);
end
    