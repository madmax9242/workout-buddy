# workout-buddy
Fitness app that allows you to review your workout from the prior use

When building this app, I used Rails and PostgreSQL. I used 2 API's in the app.  One was the Google Charts API and the other was a free weather API from Openweathermap.org.  I also used an AJAX request to pull a specific user's stats from the database to be used in a Google Chart's line graph.  

My general approach was to get the records logging and graphing working.  That was the basis of my idea for a MVP. Then I worked out making the app more responsive. I figured that an app like this would be used most often on a smart phone since most people don't bring their laptops to the gym. 

After getting a bootstrap working, I tried to figure out how to make a distance tracker using Google Maps. That was rough.  So I figured out a more basic system that utilized HTML5's geolocation feature. I think that it'll be a more useful tool if you wanted to go on a hike in the woods. That way, if you got lost, you'd know the exact geographical coordinates of your position.

I have to say that I'm still horrible with wireframe software, so I made pen and paper drawings. I included these in my assets/images folder. There aren't really any installation dependencies. The gem file is complete for the program, so you'll just have to bundle install and set up the database on your server.  

My only real problem that I couldn't crack was using Google Maps to build the distance tracker. The other method works the same way, but I wanted to try to include a map of the route that the user took. 


User stories- https://trello.com/b/Kw2z7n1I/workout-buddy

Heroku URL- https://tranquil-sea-6410.herokuapp.com/