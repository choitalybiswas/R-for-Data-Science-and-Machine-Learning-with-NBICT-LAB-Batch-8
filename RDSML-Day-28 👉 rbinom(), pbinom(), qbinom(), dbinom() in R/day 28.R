# Explaining rbinom()
# rbinom(n, size, prob) generate random numbers from a binomial distribution
# Here :
# n: Number of random values to generates
# size : Nuber of trials in each binomial experiment
# prob : Probability of succes in each trial

rbinom(n = 10, size = 1, prob = 0.5)

# Here:
# 10 --> Number of random values to generate (n=10)
# 1 --> Number of trials in each binomial experiment
# 0.5 --> Probability of succes in each trial

rbinom(n = 10, size = 5, prob = 0.5)

# Explaining pbinom
# pbinom() gives the cumulative probability of getting q of fewer success
# in a binomal distribution
# Syntax : pbinom(q, size, prob)
# Here:
# q --> The number of successes
# size --> Number of trials 
# prob --> Probability of succes in each trial

pbinom(q = 5, size = 10, prob = 0.5)

# The result means there's about 62.3% chance of getting 5 or fewer success
# in 10 trials (e.g., getting 5 or fewer heads in 10 fair coin tosses)

# You toss a coin 5 times , what is the probability of getting exactly 3 heads?
pbinom(q = 3, size = 5, prob = 0.5) - pbinom(q = 2, size = 5, prob = 0.5)

# Explaining qbinom()
# What is the smallest number of successes x in 10 trials 
# (with 50% succes chance) such that the probability of grtting x or fewer
# success is at least 30%?

qbinom(p = 0.3, size = 10, prob = 0.5)
# p = 0.3 --> cumulative probability (30%)
# size = 10 --> The number of trials (e.g., 10 coin tosses)
# prob = 0.5 --> probability of success

# Explaining dbinom()
# Calculating the probability of getting exact number of success
dbinom( x= 3, size = 5, prob = 0.5)

# dbinom (x, size, prob)
# x = 3 --> number of successes you want 
# size = 5 --> number of independent trials 
# prob = o.5 --> probability of success