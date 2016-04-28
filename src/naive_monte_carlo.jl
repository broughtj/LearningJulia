using Distributions

function call_payoff(spot, strike)
	return max(spot - strike, 0.0)
end


spot = 41.0
strike = 40.0
expiry = 1.0
rate = 0.08
volatility = 0.30
dividend = 0.0
nreps = 100000

dt = expiry
nudt = (rate - dividend - 0.5 * volatility * volatility) * dt
sigsdt = volatility * sqrt(dt)

z = randn(nreps)
spot_t = zeros(nreps)
call_t = zeros(nreps)

for i in 1:nreps
	spot_t[i] = spot * exp(nudt + sigsdt * z[i])
	call_t[i] = call_payoff(spot_t[i], strike)
end

price = exp(-rate * dt) * mean(call_t)
println("The Call price is: $price")




