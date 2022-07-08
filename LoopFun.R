# Logic, Loops and Functions

# R is a programming language and a platform for statistical analysis.

# It was designed to minimize the amount of typing required to solve 
# problems of all sizes in statistics. While it is not a general purpose
# programming language like FORTRAN, C or Java, it does support  the 
# features common to all contemporary programming languages, including loops
# and functions. 

# Notably, point and click software for statistics lack programming features
# making it very difficult to implement new functionality or automate repeated 
# tasks. 

# What are loops, and why do we need them?

# A computer program can be visualized as a flow chart. 

# Loops in the flow chart mean that the same set of instructions 
# is executed multiple times.

# Loops are repeated until some condition is reached, for example, 
# until every item has been processed. A loop to use function f to 
# process each of 10 items in a list might work like this:

# set a counter i to 1

# Step 1: pass element i of the list as input to function f
# Step 2: add 1 to counter i
# Step 3: if i is less than 10, return to Step 1.

# in R for list L:

# for(i in 1:10){
#    f(L[i])
# }

# What are functions, and why do we need them?

# As we've seen, R has tons of functions built in. Somebody connected 
# to the R Core Team designed and implemented functions like sum() and about 
# 450 others in the base package, 350 more in stats, and about 100 in 
# graphics. 

# Functions perform a well defined task again and again
# without having to copy and paste the instructions (code) again and again. Since
# functions can contain calls to other functions, they are incredibly powerful
# and relatively easy to understand. This is particularly so if the author of a 
# a function gives it a good name, and provides good comments.


# Both functions and loops are coding elements that make the finished 
# program shorter, and the source code easier to understand, test and
# maintain. This is a key feature of reuseable and robust software.
# FAIR is not just about data...


# Here is a function called C2K that changes degrees centigrade to 
# degrees kelvin

# c gets passed in 
# k comes out

C2K <- function (c) {
   k = c + 273.15
   return(k)
}

# Test the function with 1 degree C

C2K(1)

# R understands and implements many loops implicitly based 
# on data type. If a list has many elements, R functions
# often infer that a function receiving such a list should 
# be performed for every element on the list.

MyPetTypes <- c("Dog", "Cat", "Rat", "Dog")

MyPetTypes # prints them all out

MyPetTypes == "Dog" # checks each one


# The rnorm function generates random normal variables, in this case,
# 10 random numbers drawn from a distribution with mean 37 and SD = 2.

# Create an array of 10 items in centigrade.

C <- rnorm(10, mean=37, sd=2)

C

# Remember how square brackets work. Here is the first element of C:

C[1]


# This R syntax explicitly implements a loop for the 10 values stored in C,
# printing them out

for(i in 1:10){
  print(C[i])
}

# Loops can be used to perform logical tests like this:

for(i in 1:10){
  if(i > 5){
    print(paste(i, "is greater than 5"))
  } else {
    print(paste(i, "is not greater than 5"))
  }
}

# Here is a simple example of a function called inside a 
# loop

for(i in 1:10){
  C2K(C[i])
}

# This is kind of unfortunate because we can't see the output, even though 
# the calculation was performed.

# This fixes that problem: everything goes to the screen.

for(i in 1:10){
  print(C2K(C[i]))
}

# To save the output for future use, one could create a variable outside 
# the function and update this variable inside the function.

K = numeric(10) # Create list of 10 numbers (by default each is 0)

for(i in 1:10){
  K[i] = C2K(C[i])
}

plot(K)

# Again, in certain cases you don't need an explicit loop for this to work:

C2K(C)

# Here is another example.

# Adding a simple number (aka a "scalar") to a vector implies a loop. R
# handles this well.

C + 273.15

# The colon operator creates a vector. A loop must have been involved 
# under the hood, so to speak:

1:10

# Here is a very compact version of a loop and a logical check

1:10 > 5

# R can also iterate (loop) over more complex data structures such as data frames

# This statement loads a built in data set called CO2

data("CO2")

View(CO2)

# Functions in R and other languages often take data as arguments (that is, input). R
# functions can also take other functions as input, which is kind of cool.

# tapply is a great example of this. Here it is used to 
# calculate mean uptake by each type 

tapply(CO2$uptake, CO2$Type, mean)


# Green Exercises

# GREEN 1: Use tapply to calculate the max CO2 uptake by type
tapply(CO2$uptake, CO2$Type, max)

# GREEN 2: Calculate max CO2 uptake by treatment
tapply(CO2$uptake, CO2$Treatment, max)
# GREEN 3: Create a variable X that contains the following Fahrenheit values: 98.6, 100.4, 102.3
X <- c(98.6,100.4,102.3)
# GREEN 4: Write a function called F to C that maps these values to Centigrade.
FtoC<- function(f){
  c = (f-32)*(5/9)
  return(c)
}

FtoC(X)



# Blue Exercises

# Functions can do more than calculations.  

# The following code creates and saves a plot,

# The tricky bit here is the "pdf" function which diverts
# graphical output to a named file (a device). The dev.off
# function closes the file and completes the pdf.

pdf("Qn1.Scatter.pdf")
plot(CO2[CO2$Plant == "Qn1", "conc"], CO2[CO2$Plant == "Qn1", "uptake"],
     main = "Qn1",
     xlab = "Concentration",
     ylab = "Uptake")
dev.off ()

# To do this for multiple plant types, I could write a function like this,
# where t corresponds to a specific plant location. t is part of the 
# filename and the title,
  
MakePlantPlot <- function(t) {
  myPdf = paste(t, "Scatter", "pdf", sep = '.')
  pdf(myPdf)
  plot(CO2[CO2$Plant == t, "conc"], CO2[CO2$Plant == t, "uptake"],
       main = t,
       xlab = "Concentration",
       ylab = "Uptake")
  dev.off()
}

# lapply is a nice way to run a function on each item in a list


MakeTreatmentPlot <- function(t) {
  myPdf = paste(t, "Scatter", "pdf", sep = '.')
  pdf(myPdf)
  plot(CO2[CO2$Treatment == t, "conc"], CO2[CO2$Treatment == t, "uptake"],
       main = t,
       xlab = "Concentration",
       ylab = "Uptake")
  dev.off()
}
lapply(levels(CO2$Treatment), MakeTreatmentPlot)

# BLUE 1: Use this same lapply mechanism to create plots for different treatments

lapply(levels(CO2$Treatment), MakePlantPlot)


# The following code returns the summary of a linear model  of
# uptake as a function of concentration of CO2 for QN1 plants 

summary(lm( CO2[CO2$Plant == "Qn1", "uptake"] ~ CO2[CO2$Plant =="Qn1", "conc"]))

# BLUE 2: Write a function that returns the summary of a linear model of
# uptake as a function of concentration of CO2 and 
# run it for all plants using lapply

MakePlantLM <- function(t) {summary(lm( CO2[CO2$Plant == t, "uptake"] ~ CO2[CO2$Plant ==t, "conc"]))}
lapply(levels(CO2$Plant), MakePlantLM)


# Black Exercises

# There are many situations where R's built-in looping ability is the most 
# elegant way to achieve a result, why not just use those? Who needs a "for"
# loop in R?

# One answer has to do with the way variables are visible or invisible outside a 
# block of code set off by curly brackets. R is a little "like Las Vegas" in this sense.
# What goes on inside curly brackets tends to be private.

# In the example below, you'll note that X does not seem to change
# outside the lapply

X = 0

ApplyResult <- lapply(10:20, function (i) {
  print(i)
  X = i
  
})

ApplyResult

X


# For loops can modify variables defined outside: see below

X = 5

for (i in 1:10){
  X = i
}

X

# If you want to use the output of apply-type functions in R, you need 
# to assign the result of the whole loop to a variable. That may be messy. 
# Sometime you just want to change a data frame "in place" without copying it,
# and one way to do this is to loop through the rows or columns of a str

# BLACK 1: Use a "for" loop to modify the CO2 data frame, increasing the uptake values
# of Mississippi chilled by 10%.

for(i in 1:nrow(CO2)){
  if (CO2$Type[i] == "Mississippi") { 
    if (CO2$Treatment[i] == "chilled")
    (CO2$uptake[i]=CO2$uptake[i] * 1.1)
  }
}
  



# BLACK 2: Accomplish this effect without a loop





