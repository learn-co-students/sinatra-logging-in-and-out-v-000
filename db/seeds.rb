user1 = User.create(:username => "skittles123", :password => "iluvskittles", :balance => 1000)

user2 = User.create(:username => "flatiron4lyfe", :password => "Rubie!", :balance => 500)

user3 = User.create(:username => "kittens1265", :password => "crazycatlady", :balance => 10000)

user4 = User.create(:username => "mcClapYourHands", :password => "psychyouout", :balance => 101.4)

user5 = User.create(:username => "BuddyTheElf", :password => "FavoriteColor?", :balance => 123.456)

# Note: I (the student) added the last two, to test out the decimal datatype; I will reverse this if it messes up the tests.