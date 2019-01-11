require('readr') 
require('dplyr')

# import data
data <- read_csv('Data/train.csv')
# Randomly split into train and test. We can't use the given test data bc it 
# doesn't come with labels. 
test.indices <- sample(nrows(data), 200)
# TODO: finish this 

# Fit a model with all relevant variables/columns...
# Omitting Name, Ticket number, and Cabin for now as they are somewhat arbitrary
full.model <- glm(Survived ~ . , family = binomial, 
                  data = select(train, -Name, -Ticket, -Cabin))
predictions <- predict(full.model, select(test, -Name, -Ticket, -Cabin))

# TODO: Assess model accuracy

# TODO: other diagnostics

# TODO: The same for more models 
