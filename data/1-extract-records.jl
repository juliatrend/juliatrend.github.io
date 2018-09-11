DEBUG = true
if DEBUG
    day = 9
else
    if length(ARGS) != 1
        quit()
    end
    day = strip(ARGS[1])
    day = parse( Int64, day)
end
g_year = "2017"
g_month = "09"

println("processing $(g_year)-$(g_month)-$(day)")
flush( STDOUT )
#################################### start processing
push!( LOAD_PATH, raw"/home/liye/project/code/lib_julia/vmim")
@time using vmim

### get whole_data_data list from json
f = open( @sprintf("/home/liye/working_paper/2018-forecasting/%s-%s-vmim-files.json", g_year, g_month) )
str = readstring( f )
files = JSON.parse( str );

## process file of one day
area_path = "/home/liye/project/code/2-near-missing/rect.json"
out_path = "/home/liye/project/data/2-near-missing/data/$(g_month)/" * string(day)
if !ispath(out_path)
    mkdir(out_path)
end
extract_in_rect_sampling( "2017", "$(g_month)", day, files, area_path, out_path )
