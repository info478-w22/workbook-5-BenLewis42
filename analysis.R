# Workbook 6: analyze NHANES data

# Set up
library(foreign)
library(survey)
library(Hmisc)
library(tidyverse)



alq <- sasxport.get('data/ALQ_I.XPT')
demo <- sasxport.get('data/DEMO_I.XPT')


joined <- full_join(demo, alq, by = "seqn")



# sample weight : wtint2yr

sum(joined$wtint2yr)
# Sum sample weight of over 316 million, indicating that this dataset seems to
# represent a very large population, comparable to the US as a whole.


### Analysis

# The following steps will allow you to calculate the **survey weighted** 
# percentage of people in the United States who have ever have more than 4 
# (women) or 5 (men) drinks per day (not a great survey question...). As you do 
# so, remember that an easy way to calculate a percentage is to take the mean of 
# a binary (`0`, `1`) variable where `1` is a positive response. **Make sure** to 
# properly deal with people who _chose not to repond_!
#   
# 1. Using the codebook, find the question that asks about ever drinking have 4/5
# or more drinks every day. Then, change the values in the response to make it
# easier to calculate a percentage (see above).
# 
# 2. Create a **survey design** that indicates the `id`, `strata`, and `weights`
# of your dataset. Again, you'll need to see the codebook. This will also prompt
# you to indicate that the strata are Nested (an R error will guide you through
# this).
# 
# 3. Using the `svymean` function, calculate the percentage of people that have
# ever had more than 4/5 drinks per day.
# 
# 4. Using the `svyby` function, get the percentage of respondents **by gender**
# who have ever had more than 4/5 drinks per day
