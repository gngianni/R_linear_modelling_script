
if(length(commandArgs()) != 2) { 
    stop("Usage: Rscript script_name.R filename.csv")
}
   
filename <- commandArgs(trailingOnly = TRUE)[1]

dataset = read.csv(filename)

dataset

model = lm(formula = y ~ x,
               data = dataset)

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'dark red')
png("file.png")
dev.off()

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'dark red') +
  geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Regrex1 Linear Regression') +
  xlab('x') +
  ylab('y')
png("file.png")
dev.off()