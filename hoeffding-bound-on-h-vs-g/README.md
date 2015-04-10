Why does hoeffding's equation not work when h is not random?

The purple graph is the graph of cMin, green is hoffding's, and blue and red
are the two random / independently chosen sets.

The absolute difference between the ratio of heads
and tails in the population (0.5) and the sample (0.0 for cMin) is always about
0.5.

The probability that this difference (0.5) is greater than epsilon is
dependent only upon the value of epsilon. As the graph shows, the probability
is 1.0 until some time right before epsilon=0.5 at which point the probability
drops in two steps down to 0.

Hoeffding's equation operates on the assumption that v is descriptive of a
random sample. Without this assumption, hoeffding's equation doesn't hold.

So then why can't we use g with hoeffding's equation... why can we only use
our hypothesis sets? Because g was chosen because of its ability to predict
an output based on the sample data. The sample data is not random with respect
to g.

Can hoeffding's equation be used with g if we pick a new random sample from
the input set?... I think that's what's next.
