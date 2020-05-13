function path_list_out = clear_dr(path_list_in)
list = 1:size(path_list_in, 1);
for i = 1:size(path_list_in, 1)
    if (strcmp(path_list_in(i).name(1), '.'))
        list(i) = 0;
    end
end
path_list_out = path_list_in(nonzeros(list));
