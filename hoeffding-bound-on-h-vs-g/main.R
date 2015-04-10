coins <- 1000
flipsPerCoin <- 10

runs <- 500
run <- 1
experiments <- matrix(1, nrow = runs, ncol = 3)

while (run <= runs) {
  flips <- matrix(runif(coins * flipsPerCoin), nrow = coins)
  # TRUE for heads, FALSE for tails
  flips <- flips >= 0.50000
  EIn <- rep(2, coins)

  randomIdx <- round(runif(1, 1, coins)[1])
  lowestIdx <- 1

  for (i in 1:coins) {
    EIn[i] <- sum(flips[i, ]) / flipsPerCoin
    if (EIn[i] < EIn[lowestIdx]) {
      lowestIdx <<- i
    }
  }

  experiments[run, 1] <- EIn[1]
  experiments[run, 2] <- EIn[randomIdx]
  experiments[run, 3] <- EIn[lowestIdx]

  run <<- run + 1
}

p1 <- hist(experiments[, 1])
p2 <- hist(experiments[, 2])
p3 <- hist(experiments[, 3])
plot(p1, col=rgb(0,0,1,1/5), xlim=c(0,1))
plot(p2, col=rgb(1,0,0,1/5), xlim=c(0,1), add=T)
plot(p3, col=rgb(0,1,0,1/5), xlim=c(0,1), add=T)

dev.new()
hoeffding <- function(e) {
  2 * exp(1) ^ (- 2 * e ^ 2 * flipsPerCoin)
}
probGreaterEpsilon <- function(EIn) {
  dist <- abs(EIn - 0.5)
  function(e) {
    res <- rep(NA, length(e))
    for (i in 1:length(e)) {
      res[i] <- sum(dist > e[i]) / length(EIn)
    }
    res
  }
}
curve(hoeffding, col=rgb(0,1,0,1), xlim=c(0,1))
p1 <- probGreaterEpsilon(experiments[, 1])
p2 <- probGreaterEpsilon(experiments[, 2])
p3 <- probGreaterEpsilon(experiments[, 3])
curve(p1, col=rgb(1,0,0,1), xlim=c(0,1), add=T)
curve(p2, col=rgb(0,0,1,1), xlim=c(0,1), add=T)
curve(p3, col=rgb(1,0,1,1), xlim=c(0,1), add=T)
