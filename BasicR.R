# Place the "BasicR.R" file in your FAIR-2022 R project directory and open it 
# by clicking on it in the Files menu

# Run the command below by positioning your cursor just below this line and
# pushing the "Run" button in the upper right corner of your script window.

print("Hello world")

# The result should appear in the Console window. 

# Copy and paste print("Hello world") below this line and change "world" to your
# first name. Run it.

# The assignment operator in R is two characters "<" and "-" jammed right together.
# For example, to store the number 5 in a variable called x run the following code:

x <- 5

t# The new variable x and its value should appear in the environment window.


# The c function in R creates a vector or list. 

# Let's use c to create a new version of x: the first 7 numbers in the Fibonacci sequence.

x <- c(0, 1, 1, 2, 3, 5, 8)

summary(x)

mean(x)

# You can learn more about the c function or any R function using a command like this:

?c()

# The help tab should open, and say "This is a generic function which combines its arguments."

# Function arguments are the input values required for the function to work and are also
# called parameters.

# The parentheses above surround the information c needs to do its job. 

# Try this:

c(0, 1, 1, 2, 3, 5, 8)

# We can pull out the fourth value of x like this:
x[4]  

# We can add 1 to vector of numbers in x like this:
x + 1

# The next number in the Fibonacci sequence is the sum of the previous two numbers.

# We can add the next value to our Fibonacci sequence like this:

x[8] <- x[6] + x[7]

# You can see what is stored in x like this:

x

# Let's grab some data to work with 

# In the Files tab of the bottom right window of R Studio, 
# click on meta.Rdata
#load("~/Documents/Fair2022/meta.Rdata")

# Confirm that you want to load it.

# Now click on the meta object Environment tab in the upper right.
View(meta)

# Note that the very first column does not have a heading.

# These are the row names:

rownames(meta)

# You can look at column names like this:

colnames(meta)

# This object "meta" is a data frame:

str(meta)

# As a result, you can pull out columns by name

meta[, "host.age"]

# Meta has 631 rows and 16 columns
dim(meta)

# Many columns are just filled with "missing."

# We might check for that like this. This returns true and false (logical)

#== is for logical questions (i.e True/False)
meta[1, ] == "missing"


# Or the reverse 
# ! equals not

meta[1, ] != "missing"

 
# With R, we can use a list of TRUE and FALSE to select values
# from another list using square brackets.

# Which column names are associated with values that are not missing
# in the first row of the meta data frame?

colnames(meta)[ meta[1, ] != "missing"]

# Let's save this list of names in a new variable:

InterestingColumns <- colnames(meta)[ meta[1, ] != "missing"]


# One can use a list of valid column names to pullout 
# the columns we are interested in.

# Here we save a new stripped down data frame.
# Pulling out interesting columns and saving them as a new object

InterestingMeta <- meta[, InterestingColumns]

# Once you have data in R (which usually means in a data frame) 
# creating simple graphs and summary statistics is super easy.

# Sometimes it's easier for R to deal with data of just one 
# type. We've seen character type, number and logical. 

# There are functions in R to convert one kind of data into another.

# z is a number

z <- 1

z <- as.character(1)

z <- as.numeric("1")

# You can also try to turn a data frame into a matrix

InterestingMetaMatrix <- as.matrix(InterestingMeta)

# This may not be what you want because everything in the matrix is 
# now a character string

str(InterestingMetaMatrix)

# All Things have become a character string.

# The basic difference between a data frame and a matrix is that all the values
# in a matrix must be the same type, For data frames, all the values in any
# given column must be of the same type. 

# Another difference is that data frames support the dollar sign notation.

# With a data frame you can pull out a single column using a dollar sign like 
# this:

hist(InterestingMeta$host.age)

summary(InterestingMeta$host.age)

table(InterestingMeta$host_clinical_state)

# R Formula syntax

# R formulas, as they are called, are used to create statistical models 
# and graphs. Many R functions support them. 

# Here is an example of how the R boxplot function can be called
# to plot host age on the y axis as a function of host clinical
# state on the x axis, using the data frame we just created as 
# input.

# Note that spaces are not ok in R variable names. There are other 
# restrictions, too. For example, the first character in a variable 
# cannot be a digit. It should be a letter, basically. Avoid things like
# minus signs, parentheses, most punctuation in names. "_" is ok. So is ".".

boxplot(host.age ~ host_clinical_state, data = InterestingMeta )

#boxplot(host.age ~ host_clinical_state, data = InterestingMeta, xlab="Clinical State", ylab="Host Age")

# Add labels

boxplot(host.age ~ host_clinical_state, data = InterestingMeta,
        main = "Age and Clinical State",
        xlab = "Clinical State",
        ylab = "Age")

# Use the Export tab to name and save plot


# Exercises

# Green 

# 1) Does the meta data frame contain all the relevant clinical parameters you can think of?

# 2) Which columns in meta are numeric?
str(meta)
lapply(meta,is.numeric)

# 3) What columns in meta are non-informative?

# 4) Add the 9th value to the Fibonacci sequence stored in x
x[9] <- x[7] + x[8]
# 5) Make a boxplot of host fev1 as a function of host clinical state with 
# appropriate labels

boxplot(host_fev1 ~ host_clinical_state, data = InterestingMeta ,
        main= "FEV and Clinical State", xlab="Host Clinical State", ylab="FEV")

# 6) Save this plot to a pdf file using R, rather than the menu "Export --> Save as PDF...". 
# I did not tell you how to do this. Google knows. They often have great help pages.

boxplot(host_fev1 ~ host_clinical_state, data = InterestingMeta ,
                   main= "FEV and Clinical State", xlab="Host Clinical State", ylab="FEV")
pdf(file="FEV and Clinical State")
save.image(file="FEV and Clinical State")

# Blue

# 1) Make a boxplot of fev1 as a function of host_disease_aggressiveness

boxplot(host_fev1 ~ host_disease_aggressiveness, data=InterestingMeta)


# The plot function can also use the formula interface that boxplot uses.

# 2) Use plot to make a scatter plot of fev1 vs age using this "~" based 
# syntax on the meta data frame.

plot(host_fev1 ~ host.age, data=InterestingMeta)

# 3) is there a trend in fev1 as a function of age in this data set?

#not really

# The lm function also uses the formula syntax, and you can use it to
# fit a straight line to a set of x and y values. 

# Something like this

# fit <- lm(y ~ x, data=D)
# where x and y are columns in a data frame called D.

# 4) Use the lm function to fit a line to fev1 as a function of age in the
# meta data, saving the result in a variable called fit

fit <- lm(host_fev1 ~ host.age, data=InterestingMeta)

# The abline function in R understands linear model fits and 
# will place the regression line from a fit on top of a fit.

# abline(fit)

# 5) Use the plot and abline functions in succession to create a 
# scatter plot of fev1 as a function of age in the meta data frame
# and the regression line generated by lm.

plot(host_fev1 ~ host.age, data=InterestingMeta,
     main="Host and Age", xlab="Age", ylab="FEV")
abline(fit)

# Black

# One can inspect the output of a linear model fit using the 
# summary function.

# 1) Is fev1 significantly correlated with age in this data set?

summary(fit)

