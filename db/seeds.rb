# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.destroy_all
User.destroy_all
Team.destroy_all
UserTeam.destroy_all
Post.destroy_all

t1 = Team.create(name: "Endeavor-External")
t2 = Team.create(name: "Challenger-Internal")

u1 = User.create(name: "Josh Rogel", username: "jrogel", email: "jrogel@gmail.com", password: "password")
u2 = User.create(name: "Stan Wells", username: "swells", email: "swells@gmail.com", password: "password")
u3 = User.create(name: "Chen Li", username: "cli", email: "cli@gmail.com", password: "password")
u4 = User.create(name: "Vijay Kunal", username: "vkunal", email: "vkunal@gmail.com", password: "password")
u5 = User.create(name: "Saud Badar", username: "sbadar", email: "sbadar@gmail.com", password: "password")
u6 = User.create(name: "Paamela Wright", username: "pwright", email: "pwright@gmail.com", password: "password")

p1 = Project.create(name: "Oracle-Cloud", description: "Design backend architecture. Develop backend transaction systems. Connect and test node clusters. Impliment cloud based transactions methods for backend development.", start: "03/02/2019", finish: "10/10/2019", team_id: t1.id)
p2 = Project.create(name: "Tesla-Autopilot", description: "Collaborate with internal experts from Uber and Lyft. Design early wireframe for backend architecture. Begin testing for autonomous algorithms. Use test subjects donated from DaimlerBenz.", start: "04/04/2019", finish: "11/12/2019", team_id: t2.id)


ut1 = UserTeam.create(user_id: u1.id, team_id: t1.id)
ut2 = UserTeam.create(user_id: u2.id, team_id: t1.id)
ut3 = UserTeam.create(user_id: u3.id, team_id: t1.id)
ut4 = UserTeam.create(user_id: u4.id, team_id: t2.id)
ut5 = UserTeam.create(user_id: u5.id, team_id: t2.id)
ut6 = UserTeam.create(user_id: u6.id, team_id: t2.id)


p1 = Post.create(title: "New Design Template", description: "Hey, checkout the new approved template for the client.", file: "/client-template.pjx", user_team_id: ut1.id)
p2 = Post.create(title: "Update Template", description: "Sorry guys there was a typo on the last doc, thanks Chen for catching that!", file: "/client-template-final.pjx", user_team_id: ut1.id)
p3 = Post.create(title: "Happy Monday", description: "Everyone we're having Mexcal Mondays again starting next week!", file: "no-attachment", user_team_id: ut2.id)
p4 = Post.create(title: "Lost Gundam", description: "Guys I lost my Gundam figurine please message me if you see it :(", file: "no-attachment", user_team_id: ut3.id)
p5 = Post.create(title: "Reminder", description: "Project deadlines are coming up. Client has been happy so far lets keep it up.", file: "no-attachment", user_team_id: ut4.id)
p6 = Post.create(title: "New Training Algorithm", description: "Hey everyone the training algorithm is finally done please check your secure emails for the link.", file: "no-attachment", user_team_id: ut5.id)
p7 = Post.create(title: "Vacation", description: "Guys I'll be on vacation starting next week. I've already created my handover notes! If you guys need me please feel free to secure email me! See you guys next month.", file: "Handover-notes.doc", user_team_id: ut6.id)
p8 = Post.create(title: "Farewell", description: "Thank you all for the great memories! I will be moving to Norway for the end of my days in the fields where I grew up.", file: "no-attachment", user_team_id: ut6.id)



# t1 = Team.create(name: "Team1")
# t2 = Team.create(name: "Team2")

# u1 = User.create(name: "Name1", username: "username1", email: "username1@gmail.com", password: "password")
# u2 = User.create(name: "Name2", username: "username2", email: "username2@gmail.com", password: "password")
# u3 = User.create(name: "Name3", username: "username3", email: "username3@gmail.com", password: "password")
# u4 = User.create(name: "Name4", username: "username4", email: "username4@gmail.com", password: "password")
# u5 = User.create(name: "Name5", username: "username5", email: "username5@gmail.com", password: "password")
# u6 = User.create(name: "Name6", username: "username6", email: "username6@gmail.com", password: "password")

# p1 = Project.create(name: "Project1", description: "First Project", start: "03/02/2019", finish: "10/10/2019", team_id: t1.id)
# p2 = Project.create(name: "Project2", description: "Second Project", start: "04/21/2019", finish: "11/15/2019", team_id: t2.id)

# ut1 = UserTeam.create(user_id: u1.id, team_id: t1.id)
# ut2 = UserTeam.create(user_id: u2.id, team_id: t1.id)
# ut3 = UserTeam.create(user_id: u3.id, team_id: t1.id)
# ut4 = UserTeam.create(user_id: u4.id, team_id: t2.id)
# ut5 = UserTeam.create(user_id: u5.id, team_id: t2.id)
# ut6 = UserTeam.create(user_id: u6.id, team_id: t2.id)

# p1 = Post.create(title: "Title1", description: "Description1", file: "File1", user_team_id: ut1.id)
# p2 = Post.create(title: "Title2", description: "Description2", file: "File2", user_team_id: ut1.id)
# p3 = Post.create(title: "Title3", description: "Description3", file: "File3", user_team_id: ut2.id)
# p4 = Post.create(title: "Title4", description: "Description4", file: "File4", user_team_id: ut3.id)
# p5 = Post.create(title: "Title5", description: "Description5", file: "File5", user_team_id: ut4.id)
# p6 = Post.create(title: "Title6", description: "Description6", file: "File6", user_team_id: ut5.id)
# p7 = Post.create(title: "Title7", description: "Description7", file: "File7", user_team_id: ut6.id)
# p8 = Post.create(title: "Title8", description: "Description8", file: "File8", user_team_id: ut6.id)
