using DataFrames

fname = "CRSP.csv"
data = readdlm(fname, ',')

println(data[:,1:3])



