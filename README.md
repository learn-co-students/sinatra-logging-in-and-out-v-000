# Sinatra Sessions Lab - User Logins

## Introduction

You've been contracted by Flatiron Bank to consult on their online banking application. Specifically, they've asked you to build out their user login process. Based on your knowledge of sessions, build out the log in and log out features, and ensure that users that log in can only see their own balance.

## Helper Methods

MVC architecture relies heavily on the principle of separation of concerns. We make sure that we have a different model for every class we build, that we only have one erb file per view, etc. This even extends to the purposes each of these files has. A model handles our Ruby logic, our controllers handle the HTTP requests and connect to our models, and our views either take in or display data to our users.

This means that we want to minimize the amount of logic our views contain. Our views should never directly pull from the database. All of that should be taken care of in the controller action, and the data should be passed to the view via that controller action.

But if you think about most web applications you use, there is information on most pages that are dependent on being logged in. You can see a lot information if you are logged in, and practically none if you're not. So how can you handle that sort of application flow without logic?

Instead of writing that type of logic directly in your view, we use helper methods. Helper methods are methods that are written in their own class, that are accessible in your views, and provide some support. It's important to remember that a helper method is just a regular method, defined by using `def` and `end` just like you've always done, that provides help to your views.

## Instructions

+ You'll want to create one users table. Users should have a username, password, and balance (a decimal storing their bank account balance), as well as a corresponding User class.

+ You'll need to create a login form on the index page that accepts a username and password the form should have a method of `POST` and an action of `login`.

+ In the controller action that processes the post request, you'll want to find the user in the database based on it's username. 

+ If there is a match, set the session to the user's id and redirect them to the `/account` route (using `redirect to`) and use ERB to display the user's data on the page.

+ If not, redirect the user to the error page.

+ On the `/account` page, set up a link called 'Log Out', which clears the session.

+ In `app/helpers/helpers.rb`, you'll notice a predefined class `Helpers`. In this class, you'll want to define two **class** methods `current_user` and `is_logged_in?`. 

+ `current_user` should accept an argument, which is the session hash. This method should use the `user_id` from the session hash to find the user in the database, and return that user.

+ `is_logged_in?` should also accept the session hash as an argument. This method should return true if the user_id is in the session hash.

+ In `account.erb` you'll want to use the `is_logged_in?` helper method to only diplay the username and account balance if the user is logged in. Otherwise, it should contain a link to the home page. You'll also want to use `current_user` to display the username and balance. 




