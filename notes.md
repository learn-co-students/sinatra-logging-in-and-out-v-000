okay so this one threw me. Some takeaways for next time:
1. The helper methods are basic Ruby logic. It uses the @user instead of @current_user (which may have just been confusing labeling in
  different files, not expecting to cross paths with each other) because when you use it in the context of the view page accout.erb, it
  validates that that is the only user's information you are looking at at any given point in time.
  ^^ That might be a question for a teacher becuase I think the REASON you use instance variables in the controller is so they can refer to objects and the function those objects are undergoing. Definitely not sure why you essentially have the same code twice, but in the controller it's @current_user = User.find_by_id(session[:user_id]) and in the Helpers class it's the name of the function, but then uses the instance varialbe @user for the same logic!!

2. A fun new method I've never used before, nor would ever think to use!!!!! User.find_by_id (which is intuitive>?????) I suppose it makes sense for what's it's doing, looking for the assigned user_id number, which must coorespond to a foreign key in the table to connect the users to the session? It's all still very shakey.

3. What else was getting me stuck for a while? Oh this is clever but I don't know if I would have thought of it on my own
  @user = User.find_by(username: params[:username]) <-- rather than finding the user by all of it's credentials, you match a user to a user
  if @user != nil && @user.password == params[:password] <-- this is like a authenticate logic! Clever

4. Read up on each what the "session" is again. It made sense in the theoretical but in practice the idea of exactly what the hash is, is still unclear.
5. The "new" thing in this lab is supposed to be the presence of using your Helper class in the icecream cones on your view pages. It makes sense, but it's good to look through WHY it makes sense. for the first method is_logged_in? you use it as a conditional statement, which makes sense. So that way someone can't just go to /accounts without logging in and see whatever would otherwise just be there. Then current user instead of just plain old @user makes sense so that someone can't accidentally see someone else's information? Again, that makes sense in the theory but I don't completely see the inner workings of that.


Overall another struggle-filled lab. But I get what's going on more or less. I think I'll just have to go back through the other two and do psuedo writeups like this because it's helpful and detoxifying lol. 
