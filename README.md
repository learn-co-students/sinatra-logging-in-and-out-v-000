# Sinatra Sessions Lab - User Logins

## Introduction

You've been contracted by Flatiron Bank to consult on their online banking application. Specifically, they've asked you to build out their user login process. Based on your knowledge of sessions, build out the log in and log out features, and ensure that users that log in can only see their own balance.

## Notes
+ We're not using a database - instead, when you spin up the application using Shotgun, we've created a few sample users. Take a minute to look at the User model and the sample users in `User.rb`.

+ You'll need to create a login form on the index page that accepts a username and password the form should have a method of `POST` and an action of `login`.

+ In the controller, use `User.all` and your iteration skills to see if there is a user whose username and password match the params. 

+ If there is a match, set the session to the user's id and redirect them to the `/account` route (using `redirect to`) and use ERB to display the user's data on the page.

+ If not, redirect the user to the error page.

+ On the `/account` page, set up a link called 'Log Out', which clears the session.
