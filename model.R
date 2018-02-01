library(caret)
library(randomForest)

data("mtcars")

dataStructure <- capture.output(str(mtcars))


set.seed(2018)

customTrainControl <- trainControl(method = "cv", number = 10)

#RandomForest function
carsRandomForestModelBuilder <- function() {

  return(
    train(
      mpg ~ .,
      data = mtcars,
      method = "rf",
      trControl = customTrainControl
    )
  )

}

# Predictor Function.
randomForestPredictor <- function(model, parameters) {

  prediction <- predict(
    model,
    newdata = parameters
  )

  return(prediction)

}
