##################################
# LOGISTIC REGRESSION
##################################

# ensure all packages are installed
if (!require("pacman")) install.packages("pacman")
pacman::p_load(readr)

library('readr')

# import data
setwd('C:/Users/Lenovo/Documents/Kaggle/Titanic')
train <- read_csv('train.csv')
test  <- read_csv('test.csv')

# join datasets
train$set <- "train"
test$set  <- "test"
test$Survived <- NA
full <- rbind(train, test)

summary(full)
missing_per_column <- colSums(sapply(full, is.na))
missing_per_column <- as.data.frame(missing_per_column)

comp.train <- train[complete.cases(train),]

model1 <- glm(Survived ~ Pclass + Sex + Age, family = "binomial", data = comp.train)
summary(model1)