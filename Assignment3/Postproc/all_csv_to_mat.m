function [datastruct] = all_csv_to_mat(ROOTPATH)
    disp(['reading from path ',ROOTPATH])
    my_structs = dir([ROOTPATH,'*.csv']);

    N_data = numel(my_structs);
    names = cell(N_data,1);
    for i = 1:numel(my_structs)
    names{i} = my_structs(i).name;
    end

    data = [];

    for i = 1:N_data
    data = [data; dlmread([ROOTPATH,names{i}],',')];
    end

    columnnames = { 'size',...
                    'computation_time',...
                    'MPI_time'};

    datastruct = struct();
    for i = 1:3
        datastruct.(columnnames{i}) = data(:,i);
    end
    disp('done.')
end
    
