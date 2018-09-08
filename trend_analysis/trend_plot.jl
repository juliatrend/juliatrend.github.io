################################################################################
# Create the figure of the julia language trend based on the data from

# Created: Sep 8, 2018
# Authors: Liye Zhang,
#
################################################################################
Pkg.add("Plots")
using Plots
using Base.Dates
gr(legend = false)

################################ ##############################################
# Figure 1 - Julia Rank variation,
#
xs_month =  [1,      16,     17,     18,     19,     20,    21,     22, 23
            ,24]
ys_rank =   [47,     47,     47,     50,     37,     44,    46,     43, 50
            ,39]
ys_rating = [0.196,  0.439,  0.226,  0.189,  0.301,  0.195, 0.342,  0.281, 0.156
            , 0.242]

dates = Date("2016-09-01"):Month(1):Date("2018-08-01")
xs_labels = [Dates.format(d, "yyyy-uu") for d in dates]
xs = collect(1:length(xs_labels))
ys = Vector{Union{Int64}}()
for i in 1:length(xs)
    push!(ys, -10)
end

plot(xs, ys, line=(:dot,4), marker=:hex, xlabel="month", ylabel="rank", xticks=(xs, xs_labels), xrotation=90)
scatter!(xs_month, ys_rank)
plot!(xs_month, ys_rank, line=(2, :dot,1, :black ) )

hline!([50], line=(4,:solid,0.15,:green) )
plot!(annotations=(-0.5,50,text("50",:left,8) ))

vline!([1,10], line=(4,:solid,0.5,:blue) )
plot!(annotations=(1, 50+10,text("Release v0.5",:left,8) ))
plot!(annotations=(10,50+10,text("Release V0.6",:left,8) ))

ylims!((0,80))
title!("Rank of Julia")

################################################################################
# Figure 2 - Julia rating value variation
#
plot(xs, ys, line=(:dot,4), marker=:hex, xlabel="month", ylabel="ratings(%)", xticks=(xs, xs_labels), xrotation=90)
scatter!(xs_month, ys_rating)
plot!(xs_month, ys_rating, line=(2, :dot,1, :black ) )
#hline!([50], line=(2,:solid,0.5,:blue) )
#plot!(annotations=(3,50+3,text("50",:left,8) ))

vline!([1,10], line=(4,:solid,0.5,:blue) )
plot!(annotations=(1, 0.4,text("Release V0.5",:left,8) ))
plot!(annotations=(10,0.4,text("Release V0.6",:left,8) ))

ylims!((0,0.6))
title!("Rank of Julia")

######################### ReMonk Ranking #######################################
#
xs_labels = ["2014-Q1", "2014-Q3", "2015-Q1", "2015-Q3", "2016-Q1", "2016-Q3"]
xs_quater = collect(1:6);
ys_rank = [62, 57, 56, 52, 51, 52]
ys_lb = collect(30:2:65)
ys_labels = [string(v) for v in ys_lb]
plot(xs_quater, ys_rank, line=(:dot,4), marker=:hex, xlabel="Quater", ylabel="Rank",
    xticks=(xs_quater, xs_labels), yticks=(ys_lb, ys_labels), xrotation=90)
scatter!(xs_quater, ys_rank)
plot!(xs_quater, ys_rank, line=(2, :dot,1, :black ) )
ylims!((30,65))
title!("Rank of Julia (RedMonk)")

################ Popularity trend based on Stack Overflow and GitHub ###########
#
plot(xs_rank, ys_rank, line=(:dot,1), marker=:hex, xlabel="Popularity Rank on GitHub", ylabel="Popularity Rank on Stack Overflow" )
    # xticks=(xs_quater, xs_labels), yticks=(ys_lb, ys_labels), xrotation=90)
scatter!(xs_rank, ys_rank)
plot!([0,100], [0,100], line=(:solid,2, 0.5) )
plot!(xs_rank, ys_rank, line=(1, :dot,1, :black ) )

for i in 1:length(xs_labels)
    plot!(annotations=(xs_rank[i]+2, ys_rank[i]-2, text(xs_labels[i], :left, 8) ))
end

#version_name = ["v0.2", "v0.3", "v0.4", "v0.5", "v0.6"]
reease_i = [2,4,6,8,9]
scatter!(xs_rank[reease_i], ys_rank[reease_i], color=:yellow)
scatter!([85], [70], color=:yellow)
plot!(annotations=(85, 70+5, text("Legend", :left, 8) ))
plot!(annotations=(85+2, 70, text("major release", :left, 8) ))


xlims!((0, 100))
ylims!((0, 100))
title!("Rank of Julia (RedMonk)")
