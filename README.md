![](https://img.shields.io/badge/Microverse-blueviolet)

![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) 
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white) ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

# NomadDev Blog
 
> This blog is a fully functional website that will show the list of posts and allows readers to interact with them by adding comments and liking posts.

# Features

- Login.
- Create a new user.
- Create posts.
- Interact with posts, commenting on them and liking them.

# API

> This project works also as an API, so you can try with Postman the following endpoints:

 1. Aunthentication with JWT localhost:3000/api/v1/login
 2. See all posts for a given user localhost:3000/api/v1/users/:user_id/posts
 3. See all comments for a given user's post /api/v1/users/:user_id/posts/:post_id/comments 
 4. Create a new comment for a post localhost:3000/api/v1/users/:user_id/posts/:post_id/comments/new

* For routes 2 and 3 a JWT token is needed.

## Built With

- Ruby (programming language)
- Rails (framework)
- PostgreSQL (database)
- Devise gem (authentication)
- Cancancan gem (authorization)
- Linters: [Rubocop](https://rubocop.org/)
- Linters: [Stylent](https://stylelint.io/)
- Visual Studio Code (code editor)
- RSpec (testing) 

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

- [x] A web browser like Google Chrome.
- [x] A code editor like Visual Studio Code with Git and Ruby.

You can check if Git is installed by running the following command in the terminal.
```
$ git --version
```

Likewise for Ruby installation.
```
$ ruby --version && irb
```

### Setup

Clone the repository using the GitHub link provided below.

### Install

In the terminal, go to your file directory and run this command.

```
$ git clone https://github.com/VaneCode/blog_app.git
```
```
$ cd Blog-App
```
Run the following command to install all dependencies.
```
$ bundle install
```
```
$ code .
```
### Run tests

Run the local server with:
```
$ rails server
```
Open it by accessing http://localhost:3000/ on your browser.

### Run tests

To install rspec, in the terminal run this command

```
$ gem install rspec
```

To run tests, please run this command

```
$ rspec ./spec/#{filename}_spec.rb
```

### Usage

Kindly modify the files as needed.

## Author

👤 **Vanessa Bonito**

- GitHub: [@VaneCode](https://github.com/VaneCode)
- Twitter: [@BonitoNarvaez](https://twitter.com/BonitoNarvaez)
- LinkedIn: [Vanessa Bonito Narváez](https://www.linkedin.com/in/vanessa-bonito-narvaez/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/VaneCode/blog_app/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/)
- Coding Partners
- Code Reviewers

## 📝 License

This project is [MIT](./LICENSE) licensed.
