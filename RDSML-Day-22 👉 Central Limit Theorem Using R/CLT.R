# Demonstration of CLT

# Generating 10000 numbers of uniform distribution
r <- runif(10000)
hist(r)
meanr <- mean(r)
sdr <- sd(r)

# Draw three random samples from the distribution
samples1 <- sample(r, 4)
samples2 <- sample(r, 4)
samples3 <- sample(r, 4)


mean(samples1)
mean(samples2)
mean(samples3)


# Run a for loop
cl4 <- mean(sample(r,4))

for (i in 1:1000){
  cl4 <- c(cl4, mean(sample(r,4)))
}


hist(cl4)

# If we take 100 values for samples 
cl100<- mean(sample(r,100))

for (i in 1:1000){
  cl100 <- c(cl4, mean(sample(r,100)))
}


hist(cl100)


