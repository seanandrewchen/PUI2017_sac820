# PUI2017 Homework 4 Assignment 1
### Sean Andrew Chen
### sac820@nyu.edu



## Assignment 1: Review of Gokmen Dedemen, gd1097, gokmendedemen HW3


### Null and Alternative Hypotheses
The null hypothesis is worded correctly in that it is a one tailed test positing that the ratio of longer than average
to shorter than average trip durations for subscribers is the same or higher than the same ratio for customers.
However, one question is why use a one tailed test. One could posit that subscribers use the bikes more often
so they're more comfortable taking longer trips. Thus, if one is doing a one tailed test, one would want to say
that the subscriber ratio is the same or lower. On the other side, one could say subscribers use the bikes often
for quick, short trips. It is a very interesting question to ask trying to see a difference in use patterns
for different populations. I would be a little more agnostic and do a two tailed test because I can't really see
any distinct expectation for either population.


### Data
All the data seems to be correct in that he has identified the data by either subscriber or customer. However I'm a
little confused if you want to calculate an average trip duration for all users or subset it by user type. 
Do subscribers and customers have different average trip times? That said, after calculating the average
duration for all users, he created a binary variable of long or short trip. In plotting the trips, I would have
plotted separate bars for subscribers and customers with shorter and longer overlayed on each bar, rather than
having two separate bars for trip type with user type overlaid. I think it makes it harder to visually compare 
the two. The next plot I am a little confused. I am not sure what the purple means here. I think it would be good
to just print out the ratio of longer trips to all trips made for each user type. I have not seen that. 


### The Right Test
Since we are comparing two different population proportions, one could use a simple z proportional two tailed test.
# FBB *samples* not populations

This is categorical data with a somewhat large sample size. With the large sample size, we do not need to use 
the Student's T test. Since we don't really have an expectation of which way it should go (or at least I don't)
we shouldn't use the Chi Squared test. Moreover, it is hard to say what is a success and what is a non success
in terms of creating a contingency table. One could also perform a Pearson's correlation coefficient test. A
Spearman test may be inappropriate as that is based on ranks and we are looking at proportions. In all, however,
I don't think a correlation coefficient test would be worth much as we are not looking at continuous variables
but rather two proportions. Thus, a simple two tailed proportional z-test would work. 

# FBB good

# FBB did you ever submit a pull request for this file?? It should be places in your classmate's github HW3 as per instructions
