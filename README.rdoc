# Freelancelot

Freelancelot is a web application designed as a project management tool for freelancers and a tracker for their clients. Clients are given their own ticket number for project and can search from their or find it from a list of categories provided. Freelancers can log in their hours spent on a project and update the status for their client such as "Received", "In Progress" or "Completed".
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Deployment on a live system is not currently supported or recommended.

### Prerequisites

There are no known prerequisites for this project

### Installing
To experiment with this application on your local server you will need to do the following:

Fork this repository to your own account

```
https://github.com/SarahCyrDesign/freelancelot#fork-destination-box
```

Then clone the repository to your local environment

```
git@github.com:SarahCyrDesign/freelancelot.git
```

This application may require gems not installed on your local machine. Run

```
bundle install
```

Set up the database

```
rake db:migrate
```

Fill the database with fake users, project, and category info.
```
rake db:seed
```

Start up the rails server
```
rails s
```

Navigate to localhost:3000 on your computer's web browser. If you'd like to login without creating an account login as username: test@test.com, password:12345678. From here your role will be defaulted to a freelancer and there are pre-populated projects for you to edit and add to. You may choose to switch your role to a client and utilize the search functionality as well.
## Running the tests

There are currently no tests for this repository. If you would like to contribute, please see below.

## Deployment

Deploying this app to Heroku is currently not supported as the database is and queries are not Postgres compliant.


## Contributing

To contribute/ please fork and send me a pull request with any changes

   1) Fork the this repository
   2) Create a local development branch for the new additions/debugging, please rename branch to something along the lines go 'bug_fixes' or 'new_features'
   3) Commit a change, and push your local branch to your github fork
    Send me pull request for your changes to be included

## Authors

* **Sarah Cyr** - *Initial work* - [sarahcyrdesign](https://github.com/sarahcyrdesign)

See also the list of [contributors](https://github.com/sarahcyrdesign/freelancelot/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thank you to all the instructors at Flatiron School for their support, knowledge and utmost passion for code!
