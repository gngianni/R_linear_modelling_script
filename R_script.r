#!/usr/bin/env Rscript 

args = commandArgs(trailingOnly = TRUE)

if(length(args) == 0) { 
    stop("Missing filename", call.=FALSE)
} else if (length(args) == 1) {
    args[2] = "out.tt"
}
   
filename <- args [1]

dataset <- read.csv(filename)

message <- sprintf("Loading dataset from %s", filename)
print(message)
dataset

model = lm(formula = y ~ x,
               data = dataset)

invisible(png("scatter.png"))
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'dark red') +
  ggtitle(paste("Scatter plot from", filename)) +
  xlab('x') +
  ylab('y')
dev.off()

png("file.png")
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'dark red') +
  geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Regrex1 Linear Regression') +
  xlab('x') +
  ylab('y')
dev.off()