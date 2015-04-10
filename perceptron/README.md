## Perceptron Exercise
Section 1.1.2 is about the perceptron learning algorithm.

This program
exemplifies the perceptron learning algorithm by reading a set of linearly
partitionable data from a csv and graphing an animation of the perceptron
algorithm learning how to partition the data.

## Running The Algorithm
```R
source('perceptron.R')

perceptron.graph(perceptron.readData('samples.csv'))
# or
w <-perceptron.randomWeights(2)
d <-perceptron.randomDataset(w, 500)
perceptron.graph(d, 0.05)
```

## Running The Tests
Dependencies:
  - [testthat](http://cran.r-project.org/web/packages/testthat/index.html)

```bash
./test.sh
```
