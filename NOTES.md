Here is a related conversation for this lab:

Steven:
I'm working on the User Login lab. I had thought that I was supposed to have the account.erb file render the error page if the User wasn't logged in. But it turns out that while I can call helper methods inside of erb tags, I can't call #erb inside of one. I can't do this: <% erb :error %>

Razor
<%= erb :error %>

Steven:
That didn' t work, either. The strange thing is that I can do this: <% binding.pry %>. Then, once I'm inside of Pry, calling erb :error works just fine. So, maybe Pry is scoped to the controller AND the view, or something like that. but I can't say for sure.

Razor
but make sure :error it’s not nested

Steven:
Wait. Nested in what?

Razor
Can I see your file structure?
where’s your error file sitting?

Steven:
Hang on one moment, and I'll post my code...
Just curious, though: How far are you in Sinatra?

Razor
I’m starting my project  this week.
And then I’ll be done with Sinatra.

Steven:
Oh, nice! Congratulations!

Razor 
Thank you!

Steven:
Just for the record, I used AAQ earlier; we got my code working, but now I'm trying to figure out why it works, and why other stuff doesn't.
You're welcome!
OK, my code changed a lot. I need a minute to replicate what I had.

Razor
Do you have a repo?
Don’t worry about it, don’t want to mess you up.
I was just curious.

Steven:
OK. And don't worry; I just commented out a few things that I can reverse later. One moment...
I'm going to copy/paste bits and pieces here. At one point, my get '/account' route looked like this:

get '/account' do
    @session = session
    erb :account
  end

And my account.erb file looked like this:
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" href="stylesheets/bootstrap.css" type="text/css">  
  </head>
  <body id="page-top">
    <% if Helpers.is_logged_in?(@session) %>
      <% user = Helpers.current_user(@session) %>
      
      <h1>Welcome <%= user.username %></h1>
      <h3>Your Balance: <%= "#{user.balance.round(2)}" %></h3>
      
      <a href="/logout"><button>Log Out</button></a>
    <% else %>
      <% erb :error %>
    <% end %>
  </body>
</html>

And that got this error:

Failures:

  1) ApplicationController GET '/account' shows the error page if user goes directly to /account
     Failure/Error: expect(last_response.body).to include('You Must <a href="/">Log In</a> to View Your Balance')

       expected "<!DOCTYPE html>\n<html>\n  <head>\n    <meta charset=\"UTF-8\">\n    <title>title</title>\n    <link...ad>\n  <body id=\"page-top\">\n    \n \n      \n      \n      \n      \n    \n  </body>\n</html>" to include "You Must <a href=\"/\">Log In</a> to View Your Balance"
       Diff:
       @@ -1,2 +1,18 @@
       -You Must <a href="/">Log In</a> to View Your Balance
       +<!DOCTYPE html>
       +<html>
       +  <head>
       +    <meta charset="UTF-8">
       +    <title>title</title>
       +    <link rel="stylesheet" href="stylesheets/bootstrap.css" type="text/css">
       +  </head>
       +  <body id="page-top">
       +
       +
       +
       +
       +
       +
       +
       +  </body>
       +</html>

     # ./spec/sinatra_logging_in_and_out_spec.rb:75:in `block (3 levels) in <top (required)>'

Finished in 0.37048 seconds (files took 1.38 seconds to load)
14 examples, 1 failure

Failed examples:

rspec ./spec/sinatra_logging_in_and_out_spec.rb:73 # ApplicationController GET '/account' shows the error page if user goes directly to /account

The problem is that the README wasn't too clear about what goes where.
That, and it didn't mention that we were supposed to render the error page when the user goes DIRECTLY to the /account route.

Razor
But the spec test for this lab tells you about rendering the error page if the user types www.mydomain/account

Steven:
Right. The spec test does; the README does not. What's really weird is that the README says this:
In account.erb, you'll want to use the is_logged_in? helper method to only display the username and account balance if the user is logged in. Otherwise, it should contain a link to the home page. You'll also want to use current_user to display the username and balance.
So again, that sounds like I'm supposed to call the helper methods inside of the view, not the controller. Although, calling #current_user inside of the view makes sense.

Razor
I see, huh!  I don’t read the readme anymore, I just comment out the specs, run learn, and then use the spec as my guide.

Steven:
I may have to try that, at this point. Focus more on the specs than the README.

Razor
Yeah, you can use both.

Steven:
Right. But again, given the lack of consistency between the two, that's where my troubles started :sweat_smile:
Wait a minute. Are you currently working on Fwitter?
There's someone looking for a pair-programming partner right now.

Razor
I’m starting Fwitter this week.
I’m looking for someone.
I have another guy, so we can work together if you want.

Steven:
I'm not there yet, but check out some of the other Sinatra channels. Someone named Smokeythebear is looking for a partner.

Razor

get ‘/account’ do
   if logged_in?
     @user = User.find(session[:user_id])
     erb :account
   else
     redirect ‘/login’
   end
 end

Do you have this in your account?
This is what is saying.
Yeah, I’m talking to smokey bear.
I can wait.
So if user types www.myappdomain/account and it’s not logged in, then it will be redirected to the log in page.
In account.erb, you’ll want to use the is_logged_in?
Which is this in the read me

Steven:
Right. By the way, here are the helper methods for that:

class Helpers
  def self.current_user(session_hash)
    User.find(session_hash[:user_id])
  end 
  
  def self.is_logged_in?(session_hash)
    !!session_hash[:user_id]
  end
end

Razor
Yeap, so you have a module.
We get different exercises, but with the same requirements.

Steven:
Ah, OK. The other thing is that the specs in my exercise actually want the error page instead of the login page to be rendered if someone who isn't logged in goes directly to /account.

Razor
In my exercise the login calls the error page if user is not authorized.
so your code should look like this:

get ‘/account’ do
 if !Helpers::is_logged_in?(session)
   display info
 else
   display error
 end
end

Is that right?

Steven:
I need to test that out, but I think you meant Helpers.is_logged_in?(session).
You only use namespaces if you have a class inside of a module, I think. #is_logged_in? is a class method, though.

Razor
Yeap, that’s what I mean. Sorry!
But if you project includes the files in your environment, then you don’t need the namespace.
You can just say if is_logged_in?(session)
We can screenshare if you want.

Steven:
Actually, I just tried that (from binding.pry inside of the get '/account' route). I got a NoMethodError for the ApplicationController class (the class that my routes are defined in). So, I do have to use Helpers.is_logged_in?(session).
Or, in this case, if Helpers.is_logged_in?(session)

Razor
Ok, that’s because you don’t have that in your environment files.
Yeap, that should work.
if Helpers.is_logged_in?(session) erb :acccount else erb :error end

Steven:
Interesting. That works, except for one thing: I think you also need to set the instance variable for the current user, like this:

get '/account' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
    else
      erb :error
    end
  end

By the way, if you want to post multiple lines of code like I just did above, use three backticks (the symbol underneath the ~ next to the 1 key).
For a single line of code, use one backtick on each side of the code.

Razor
How many times? 3?

Steven:
Yeah. 3 backticks before the code, and 3 backticks after it.

Razor
I see, cool, thank you!
You don’t need the @user variable here.
Think about it this way.
You go to your email account in someone’s computer or browser.
and you type www.gmail.com
Or better yet www.gmail/account.com
You didn’t send the server anything about your user name or pw
You only try to log in into your account directly by typing this www.gmail/account.com
So gmail will direct you to a login page or give you an error.
In this case the /account request doesn’t even touch your @user instance variable, right?
if Helpers.is_logged_in?(session) this statement will return nil, and the else will execute.
But let me rephrase it.
You will need only if you’re inside the if statement, wich it will make sense.
in your view you will need the @user variable. then to display @user.account, and @user.balance.
I’m sorry man, I hope i’m not confusing you.
We were talking about the error page first.

Steven:
That's OK. But I think I caught onto something: I don't need the @user instance variable because I can use the session hash and call Helpers.curent_user from inside of the view, anyway.
There's something else I discovered as well, but I need to play with Shotgun really quickly, first.

Steven:
OK, there's something I'm still not getting. Why does the line erb :error need to be inside of an "else" statement? I thought that when you went to the account.erb page, that would exit out of the controller completely.
That is, I thought that this would work:

get '/account' do
    if Helpers.is_logged_in?(session)
      binding.pry
      @user = Helpers.current_user(session)
      erb :account
    end
    erb :error
  end
  
Not only does that get an error, but when I log in with the correct info in Shotgun, even though I am able to get to the binding.pry, it goes to the error page instead of the account as soon as I exit Pry.

Razor
Ok, you always need the @user variable because it has the information you will display on the view.

Steven:
Right. That part makes sense. What I don't understand is why the code above doesn't work, but the code below DOES:

get '/account' do
    if Helpers.is_logged_in?(session)
      binding.pry
      @user = Helpers.current_user(session)
      erb :account
    else
      erb :error
    end
  end
  
Minus the binding.pry, of course.

Steven:
OK, this is interesting. Right now, I have a binding.pry inside of my account.erb file as well as my /account route:

get '/account' do
    if Helpers.is_logged_in?(session)
      binding.pry
      @user = Helpers.current_user(session)
      binding.pry
      erb :account
      binding.pry
    end
    binding.pry
    erb :error
  end
  
When I used Shotgun to log in with a valid user, ALL of those binding.pry statements (including the one inside of my account.erb file) got called! I didn't think it worked like this, but evidently, ALL of the code inside of the route gets executed, even for a valid user; I thought I would exit out of the route entirely as soon as erb :account was called, but that does not seem to be the case.
Here's my account.erb file, in case I missed something:

Razor
But pry doesn’t exit you out the code, pry is a breakpoint or pause in your code.

Steven:

```<!DOCTYPE html>
<html>
 <head>
   <meta charset="UTF-8">
   <title>title</title>
   <link rel="stylesheet" href="stylesheets/bootstrap.css" type="text/css">
 </head>
 <body id="page-top">
   <% binding.pry %>
   <% current_user = Helpers.current_user(session) %>
   <h1>Welcome <%= current_user.username %></h1>
   <h3>Your Balance: <%= "#{current_user.balance.round(2)}" %></h3>
   <a href="/logout"><button>Log Out</button></a>
   <% binding.pry %>
 </body>
</html>

Right. I should have said "each time I exit Pry, it goes to the next binding.pry statement".

Razor
Yes, that makes sense.
It should go to the next pry because the code keeps executing, pry is just a pause.

Steven:
Right. I just didn't expect ALL of the binding.pry statements to be called. I thought that the binding.pry under the erb :account and the binding.pry after the "if" statement (right above erb :error) would NEVER get called, but I was wrong; they BOTH got called.

Razor
I see, but remember, pry is just a pause in your code. The rest of the code keeps executing.  Pry are only breakpoints.
But is good that you’re trying this thing.

Steven:
Right. That part I understand. What I don't get is why Sinatra executes the erb :error statement even after it goes to the account.erb page. I thought that it would exit the route altogether at that point.
Or maybe I should say Shotgun, not Sinatra per se. Possibly both :sweat_smile:

Razor
So you’re saying that when you make a /account request it goes into both, the if and the else?

Steven:
Not quite. If I have an "else" statement, my code works as intended. But if I don't put that erb error inside of an "else" statement, like this:

get '/account' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
    end
    erb :error
  end
  
Then, the error page still gets rendered even after erb :account gets executed

Razor
Yes, that makes sense.

Steven:
Like I said, though, this works just fine:

get '/account' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
    else
      erb :error
    end
  end

Razor
Because the is a function that takes an argument of /account, if the if is true, it will execute,  then it executes the last statement as well wich is the erb :error
Yeah, that code works fine.
Because the get is a function that takes an argument of /account, if the if is true, it will execute,  then it executes the last statement as well wich is the erb :error
Yeah, that code works fine.
I meant

```get ‘/account’ do
   if Helpers.is_logged_in?(session)
     @user = Helpers.current_user(session)
     erb :account
   else
     erb :error
   end
 end
 
```get ‘/account’ do
   if Helpers.is_logged_in?(session)
     @user = Helpers.current_user(session)
     erb :account
   else
     erb :error
   end
 end
 
```get ‘/account’ do
   if Helpers.is_logged_in?(session)
     @user = Helpers.current_user(session)
     erb :account
     return
   else
     erb :error
   end
 end
 
Steven:
Oh, don't forget the backticks after the code, too.

Razor
Try this I mean.
Ok

get '/account' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
      return
    else
      erb :error
    end
end

get '/account' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
      return
    end
      erb :error
    end
end

This I mean, sorry i’m trying to learn this slack stuff.
take off one end

Steven:
No worries. I tried that just now. But for some reason, that "return" statement causes the account page to show up blank.

Razor
If   if Helpers.is_logged_in?(session) returns true, it should display account, and then leave the get method.

Steven:
Here's another Slack tip, by the way: if you want to write multiple lines in one message (code, lists, etc.). then use Shift-Enter at the end of each line.
Also, I just executed this code:

if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
      return
      erb :error
    end
    
Razor
Ok, thanks.
No, not like that.

Steven:
You're welcome :grin:. And what code was I supposed to run?

Razor
```
get ‘/account’ do
   if Helpers.is_logged_in?(session)
     @user = Helpers.current_user(session)
     erb :account
     return
   end
     erb :error
end``
get '/account' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
      return
    end
      erb :error
end

Steven:
Ah, OK. One second.

Razor
That shouldn’t  take you to the error page ever.

Steven:
Yeah, I see now that I don't get to the error page. But there's another problem: although I am now on the /account page, it's completely blank.

Razor
put a pry between erb :account and return and see what happens.
It’s executing fast.

Steven:
Hmm. I never saw the /account page get rendered. Right now, my program is paused by the binding.pry statement, but my login page is still showing up.
image.png 
image.png

Razor
Huh?
Then I guess the program exits without erb :account.

Steven:
Yeah, you'd think. But I just put a binding.pry inside of the account.erb file, too. Even though my browser is still showing the page above, my code is now paused here:

From: /home/Sdcrouse/sinatra-logging-in-and-out-v-000/app/views/account.erb @ line 9 :

     4:     <meta charset="UTF-8">
     5:     <title>title</title>
     6:     <link rel="stylesheet" href="stylesheets/bootstrap.css" type="text/css">
     7:   </head>
     8:   <body id="page-top">
 =>  9:     <% binding.pry %>
    10:     <% current_user = Helpers.current_user(session) %>
    11:
    12:     <h1>Welcome <%= current_user.username %></h1>
    13:     <h3>Your Balance: <%= "#{current_user.balance.round(2)}" %></h3>
    14:

[1] pry(#<ApplicationController>)>

So, my program IS going inside of the account.erb file.

Razor
That’s what I thought, it just executing fast.
Ok man, I hope this helps you a little.  Let me know if I can help you when anything else.

Steven:
Sounds good! My apologies for the rabbit hole :sweat_smile:

Razor
That’s how code talk starts and it ends.
But remember that views will always need access to controllers instance variables, that’s how they send info one to another.

Steven:
Yep. Makes sense. Thanks for your help!

Razor
Sure!

Steven:
...You know what? I think I just figured something out. I may have confused #erb with #redirect.

Razor
Ok, let’s talk about them if you want.

Steven:
Maybe it's #redirect that exits the route, not #erb

Razor
Yes, and do you know why?
Try it.
And then tell me why.

Steven:
Because it's redirecting you to another route. #erb just renders a View file. I think that's where I've been getting confused this whole time!

Razor
Try it!

Steven:
OK, one second.
OK, MORE than a second :sweat_smile:

Steven:
OK, I figured it out. I still don't fully understand how the flow of the view and controller works with those "if" and "else" statements with the calls to #erb and #return. That's a rabbit hole for another time. However, I played around with #redirect. First, I made these routes:

get '/user-logged-in' do
    "The user is logged in!"
  end
  
  get '/user-not-logged-in' do
    "The user is NOT logged in."
  end
  
Then I put this code into the controller:

get '/account' do
    # if Helpers.is_logged_in?(session)
    #   redirect '/user-logged-in'
    # else
    #   redirect '/user-not-logged-in'
    # end
    
    if Helpers.is_logged_in?(session)
      redirect '/user-logged-in'
    end
    redirect '/user-not-logged-in'
       
  end
  
As I thought, the commented and un-commented code work the SAME WAY. #redirect exits out of the get '/account' route completely, which is what I mistakenly thought that #erb did. I got the two mixed up :sweat_smile:

Razor
But do you know why?
I give you a hint, it has to do with http request.
What is the single most important thing about an http request?
And what is a render vs an request?

Steven:
In this case, if redirect '/user-logged-in' gets executed, redirect '/user-not-logged-in' NEVER does. And to answer your questions, the routes are independent of each other, none of them knowing about the others or their instance variables. ...I had to look up the phrase that I couldn't remember, but it's because HTTP is a "stateless protocol". So, when one route redirects to another, Sinatra executes the code inside of that route, but it won't go back to the route that it was redirected from (unlike Ruby methods, which DO return to whatever code called them). Sorry if I got too wordy there :sweat_smile: . To answer your last question, a render is the loading of a webpage/view (HTML, CSS, JS, etc.), while a request goes to a route in a controller.

Razor
In regard to your question what does stateless mean?  What happens to variables after a request gets served?

Steven:
Ah, they get deleted, essentially (except inside of a rendered view, where they are accessible).
Sessions aside, controller routes don't know the value(s) of the other routes' variables.
Eh, I can say that better. Controllers remember the session hash from one route to another, but they don't remember local or instance variables from one route to another.
That's what makes HTTP requests stateless.

Razor
Good try.
Http requests don’t remember any variables. When you make a request or redirect there are both requests. So in your case after you redirect, the program doesn’t come back to your method and finishes executing the rest of the code.  The method itself is a variable or an object and it gets destroy.  Any code after a redirect will never even be born.
The request leaves the server, and goes back to the client.  In the case of the redirect, the redirect is being done by the server itself. So the requests exits the server, and it comes back in.  So in a way is a request on top of another request.
As for a render, the render doesn’t leave the application.  It stays until the requests goes back.

Steven:
...Pardon me; I was writing a few notes. And I see now; when a route makes an HTTP request to another route, that former route ITSELF, not just its instance variables, gets destroyed! And yeah, everything else here makes a lot of sense, too. So if I compare the route to a method, #erb can be compared to a call to another method, but #redirect is roughly equivalent to #return (not a perfect analogy, I know - #redirect does a lot more than that). (edited)

Steven:
And thanks to you, I have a better idea of the client-server interaction.
new messages

Razor
Glad to help.

Steven:
Cool. I'll be sure to ask you if I have any more questions. Have a good night!