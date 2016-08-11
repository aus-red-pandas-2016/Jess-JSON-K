 User.delete_all
 Post.delete_all
 Answer.delete_all
 Comment.delete_all

 # Users seeds
 User.create(username: "ATXKatrina", password: "katsandcoco")
jay = User.create(username: "lukin41280", password: "doubledadjokes")
sean = User.create(username: "seanswitt", password: "levelexpert")
kim = User.create(username: "kpatton", password: "newhoodieswag")
 User.create(username: "flyingsarah", password: "aerialcoding")
 User.create(username: "tj-oh", password: "bestguitarist")
 User.create(username: "cjessett", password: "sandalman")
 User.create(username: "mmmcgee", password: "punkrockqueen")
tom = User.create(username: "tomscode", password: "istherealjoke")



post1 = Post.create(title: "Drunk AF - need snack", question: "I just drank 17 beers (not that light shit either) and I really need a fucking snack. What would you suggest?")
post2 = Post.create(title: "Recent breakup - help", question: "My boyfriend just dumped me for a set of twins. I am currently weeping in Wal-Mart, what snacks should I buy to drown my sorrows")
post3 = Post.create(title: "New to America", question: "I new to here. I like the snack but I am different for what to eat. Americans, give me word for a snack")
post4 = Post.create(title: "Party up in here!", question: "I am amidst a killer rager and we are out of snacks!!!! FML!!! I need some quick ideas to stock up party")
post5 = Post.create(title: "Yo Dawg", question: "I need some ideas on how to pimp out my snacks")

tom.posts << post4 << post5 << post2
jay.posts << post3
sean.posts << post1

answer1 = Answer.create(description: "You should really go grab giant bag of chocolate bars, a gallon of ice cream, and a carton eggs - to throw at your ex's new car")
post2.answers << answer1
kim.answers << answer1

comment1 = Comment.create(description: "Thank you so much for the advice! Finished all of my snacks already though. And the police chased me...")
answer1.comments << comment1
tom.comments << comment1
