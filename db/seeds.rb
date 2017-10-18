# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "Test1", email:"test@test.com", password:"12345678")
User.create(name: "Test2", email:'test2@test.com', password:'12345678')
User.create(name: "Freelancer1", email: 'freelancer1@test.com', password: '12345678', role: 'freelancer', id: 1)
User.create(name: "Freelancer2",email: 'freelancer2@test.com', password: '12345678', role: 'freelancer', id: 2)
User.create(name: "Freelancer3", email: 'freelancer3@test.com', password: '12345678', role: 'freelancer', id: 3)
User.create(name: "Client", email: 'client@test.com', password: '12345678', role: 'client', id: 4)
User.create(name: "Admin", email: 'admin@test.com', password: '12345678', role: 'admin', id: 5)

Category.create(name: 'Graphic Design', id: 1, user_id: 1)
Category.create(name: 'Illustration', id: 2, user_id: 2)
Category.create(name: 'Video Editing', id: 3, user_id: 3)


  Project.create(title: "Tigerzord logo",
         freelancer_id: 1,
         category_id: 1,
         description: 'A simple 4 color logo in vectors',
         client_name: 'White Ranger',
         invoice_sent: false,
         status: 'In Progress',
         budget: 50,
         time_log: 5,
         start_date: Date.new(2017,9,1),
         deadline: Date.new(2017,10,1),
         ticket: 001)


  Project.create(title: "Unicorn Painting",
         freelancer_id: 2,
         category_id: 2,
         description: 'Oil Painting of a majestic Unicorn',
         client_name: 'Rainbow Dash',
         invoice_sent: true,
         status: 'Completed',
         budget: 200,
         time_log: 20,
         start_date: Date.new(2017,8,10),
         deadline: Date.new(2017,9,1),
         ticket: 333)


  Project.create(title: "Family Fishing Trip",
         freelancer_id: 3,
         category_id: 3,
         description: '10 montage video with color editing',
         client_name: 'Hank Hill',
         invoice_sent: true,
         status: 'Received',
         budget: 20,
         time_log: 0,
         start_date: Date.new(2017,10,1),
         deadline: Date.new(2017,11,15),
         ticket: 5299)
