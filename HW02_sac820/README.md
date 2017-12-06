# PUI2017 HW2 

### Sean Andrew Chen - sac820@nyu.edu


## Assignment 1 and 2

#### Collaboration

I did the vast majority of this work by myself. However I consulted with 
Sam Ovenshine (*sgo230@nyu.edu*) on a few specific problems. We both 
independently decided to use the Request method instead of the Urllib
for the API requests. However, I was having a bit of trouble deciphering
the JSON file. I independently realized that I had not given a specific
parameter to make sure I received the OnwardCalls information. I asked
Sam if he was able to get it and what path of keys he was using. We discussed
how he used error exceptions for the buses without onward call information, 
though I decided to just check if the key existed or not before an error
could be raised. 

#### Methods

I am used to using the get request method for APIs, so that is what I decided
to use. I am also much more used to the CSV module method for writing and 
reading CSVs. 


#### Difficulties

Honestly, the vast majority of the difficulties I experienced were simply in
being able to parse the very long JSON/dictionary. Its deeply nested structure
was hard on the eyes. When I used a Python terminal to get initial responses,
it was not very human friendly, so I used an online formatter to give it
that more traditional JSON look. There was the oddity that inside the
dictionary, when it came to each individual bus, it became a list. I had to
discover that the hard way when I would get an error saying that I needed
an integer rather than a string to define its element. 


#### Lessons Learned

Reading and understanding the API documentation fully beforehand really is 
important. I realized that I was not passing all the pertinent parameters
in the get request so I was not getting all the information I needed.
You need to detail that you want the onward call information as well
as how many onward stops you want (you don't want all of them, just the next).
Also, how you pass the line's name is important. It is not just the line 
(i.e. B52) but "NYCT_B52". One of the annoying things was that the 
documentation only showed the response in XML. However, I used a website
that would turn XML into JSON, so I used that to see what the key path 
would be to the values I wanted. 




## Assignment 3

Again, I did all the work by myself. The only help I had was asking Sam Ovenshine how he got his data because the data hub facility was broken. He gave me the link that worked. 
