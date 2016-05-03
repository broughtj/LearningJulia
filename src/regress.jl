function regress(y::Array{Float64,2}, x::Array{Float64,2})
	xpx = x' * x
	xpy = x' * y
	beta = xpx \ xpy

	return beta
end

function simulate_ols(beta::Array{Float64,2}, m::Int64)
	x = ones(m, 2)
	x[:,2] = rand(m, 1)
	u = randn(m, 1)
	#y = x * beta + u 
	y = x * beta + u

	return (y,x)
end

# main
m = 10000
beta = reshape([0.75, 3.45], 2,1)
println("The true coefficients are: $beta")

y,x = simulate_ols(beta, m)

beta_hat = regress(y,x)
println("The estimated coefficients are: $beta_hat")














