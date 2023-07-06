
filename = 'regrex1.csv'

dataset = read.csv(filename)

dataset

model = lm(formula = y ~ x,
               data = dataset)

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'dark red')

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$x, y = dataset$y),
             colour = 'dark red') +
  geom_line(aes(x = dataset$x, y = predict(model, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Regrex1 Linear Regression') +
  xlab('x') +
  ylab('y')
