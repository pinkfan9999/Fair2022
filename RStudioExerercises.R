# Explore the mtcars data set that comes with R

#dimensions of cars data set
dim(mtcars)
# Can also use View(mtcars)
# Str will tell you the "type" of data in each row.
str(mtcars)

summary(mtcars)

plot(mtcars$mpg, mtcars$hp)

# Use the Packages tool to load the gplots package from CRAN

# load gplots library

library(gplots)

# Heatmap requires a matrix, so let's turn mtcars into a matrix called x

x  <- as.matrix(mtcars)

heatmap.2(x)

# Sve the image using Export

# Save data in spreadsheet format

write.csv(x, file = "mtcars.csv")

# Load some data in from the Internet

d <-  read.csv(url("https://raw.githubusercontent.com/smach/NICAR15data/master/BostonWinterSnowfalls.csv"))

View(d)

str(d)

plot(d$Total)
lines(d$Total)

# Notice how x and d are in your Evironment tab.

# We can remove items from the environment using the broom, or rm()

rm(x)

# Note, the variable disappears from your environment

# You can put it back like this


x  <- as.matrix(mtcars)

# Exercises: Green
# 
# Create a new variable x2 by copying x, like this

x2 <- x

# 1) Make a heatmap of x2

heatmap.2(x2)

# 2) Save x2 as a csv file named "fred.csv"

write.csv(x2, file="fred.csv")

# 3) Read fred.csv into a new variable called x3

x3 <- read.csv(file="fred.csv", row.names = 1)

# 4) Quit R Studio, saving all objects



# 5) Reopen this project and make a heatmap of x3

x4 <- as.matrix(x3)
heatmap.2(x4)



# Exercises: Blue
# 
# Read in new data from the internet by executing this line:

acs <- read.csv(url("http://stat511.cwick.co.nz/homeworks/acs_or.csv"))

# 1) How many rows and columns are in this data set?

dim(acs)


# 2) What kinds of data are in the columns?

str(acs)

# 3) Create summary statistics for acs

summary(acs)

# 4) Make and save a plot of husband, wife ages

plot(acs$age_husband,acs$age_wife)



# 5) Make and save a plot of husband, wife income

plot(acs$income_husband,acs$income_wife)







