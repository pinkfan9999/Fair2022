
# This script assumes you have already created a new project and have set it up in a 
# new folder.

# Maybe FAIR-2022 under "Documents"?
#
# Put RStudio.R and RStudioExercises.R in this new R Project folder.
#
# You can open this file,  RStudio.R by clicking on it or opening it from 
# the File tab.
#
# I created the file in R Studio using the file tab like this:
#
# File --> New File --> R Script
# 
# The lines of this file sometimes begin with a #
# 
# When R sees this character, it will ignore whatever follows it 
# on the same line. I use lines like this to write notes to myself.
# Computer programmers also refer to these notes as comments.
#


# To run the following line, you put your cursor near it then 
# select "Run" above

date() 

# The result should appear in the console window.

# To learn more about the date function, run this line

?date

# That pulls up a help window, typically over there on the right.

# R Studio windows have many tabs and things you will want to select
# and click on.

# Perhaps the most amazing feature of R is contributed software. Software 
# is called modules, libraries or packages. But when you first start up R,
# you just get the basics.

# Click on the Packages tab on the right to see what you have access to. Mine comes 
# up with base, stats, utils and a few others.

sessionInfo()

# R comes with sample data

View(cars)

plot(cars)

# Now you should see a plot over there on the right.

# Export this plot to a file

# Now click on the Files tab over there on the right. The file you saved will be there.

# But where is "there"? You can see the path to the current directory in the 
# Files tab, or by running this.

getwd()

print("my name is intentionally left blank")

# Now copy and paste the line above, but edit it to be more correct:

print("My name is Tom")

# Now let's make a mistake

print("My name is Tom")

# The red x tells you what to do... sort of

print("My name is Tom")

# R Studio sees a different problem now. 


# Create a variable x

x <- 5

# Note that x appears in your environment window.

# Quit R.

# R will ask about saving this script and the R workspace. 

# You should almost always save scripts and workspaces.

# Projects include both scripts and data.

# Relaunch RStudio. 

# Now click on RStudioExercises in the Files tab

