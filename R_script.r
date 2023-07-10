#!/usr/bin/env Rscript 

# Define arguments
args = commandArgs(trailingOnly = TRUE)

# User must put in filename to run script 
if(length(args) == 0) { 
    stop("Missing filename", call.=FALSE)
} else if (length(args) == 1) {
    args[2] = "out.tt"
}

# filename variable 
filename <- args [1]

# Print out dataset 
dataset <- read.csv(filename)

message <- sprintf("Loading dataset from %s", filename)
print(message)
dataset

# Define model
model = lm(formula = y ~ x,
               data = dataset)

# Set a variable for the scatter plot filename 
scatter_filename <- paste(filename, "scatter.png") 


# Print scatter plot of x/y data 
library(ggplot2)
png(filename = scatter_filename)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'dark red') +
  ggtitle(paste("Scatter plot from", filename)) +
  xlab('x') +
  ylab('y')

# store dev.off() in a variable to repress the output of "Null device" 
repress_output <- dev.off()

# Set variable for linear regression filename 
regression_filename <- paste(filename, "linear regression.png")

# Print linear regression png 
library(ggplot2)
invisible(png(filename = regression_filename))
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'dark red') +
  geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle(paste("Linear Regression from", filename)) +
  xlab('x') +
  ylab('y')

# store dev.off() in a variable to repress the output of "Null device" 
repress_output_1 <- dev.off()