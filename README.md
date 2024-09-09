Author: Andy Cheng

Contact Info: aycheng8@terpmail.umd.edu

# About #

The GDD AI project essentially is a layer which interacts with OpenAI via API calls. Where our project improves upon the conventional ChatGPT use case is that we are creating Assistants (essentially a private GPT that you can customize and tune) and using fewshot learning to train it with the knowledge that we want it to have. Essentially, we aim to have our own OpenAI Assistant become a trustworthy expert on the seven worthwhile goals of global development.

# Nuts and Bolts (Requirements)

The project relies on having an OpenAI account. OpenAI charges money per API call depending on its complexity. In the near future, we would need to generate a API key from OpenAI's platform and then embed that API key in our project.

Visit: https://platform.openai.com/api-keys

# Value #

By streamlining the process of getting responses from OpenAI, we can help end users make more efficient use of their time. In theory, our application will be much more convenient and powerful than using OpenAI merely through a ChatGPT prompt. For example, by implementing templates, an end user could generate a proposal or policy in the context of a business email.

In our current alpha build of the project, the Ruby on Rails web application asks for an input (i.e. some kind of question to be answered like "Is it ethical to raise the drinking age restriction?") and it will then take that input and make an API call to OpenAI. It then saves the response in the Proposals table in the database. 

# The Future #

My present vision for our web application is to effectively establish a unified portal that can be utilized by different organizations. Each organization will only be able to see proposals from within their organization. Furthermore, I would propose a WSYIWYG editor so that proposals can be "tuned" under human discretion. Templates is another valuable feature that allows end users to specify how they want OpenAI responses formatted visually.

# The Rails Justification #

My first choice for implementing this project is in a web framework called, Ruby on Rails. It allows for easy, rapid development, and integrates a database as part of the framework. The developer setup is similar for Windows and Mac users. The Ruby community is well known for utilizing gems (essentially plugins) which opens up a wide range of features and functionality. For instance, we use the gem, HTTParty to make API calls (i.e. GET or POST requests). As another benefit of the Rails framework, it can be integrated with various front end frameworks such as Vue or React.

# Terminal / Command Lane #

If you see a command mentioned, you are executing them within a MacOS terminal or Windows WSL2 command prompt.

# Database Setup #

You will need to install the database software, we use postgres for our project. See instructions @

https://www.postgresql.org/download/

Either you will use Homebrew to install it on Mac or apt on a WSL2 environment.

After you install the database, you will need to start the Postgres service on your machine. Then, you will need to "bash" into your Postgres console to create a user on your database and grant it the appropriate permissions.

1. sudo -u postgres psql

2. postgres=# create user postgres with encrypted password 'postgres';
3. postgres=# grant all privileges on database gdd-ai-staging to postgres;

In Rails, the database is configured in a database.yml file, please see: 
https://github.com/aryeshuacheng/gdd/blob/master/config/database.yml

From database.yml:

* development:
* database: gdd-ai-staging
* username: postgres
* password: postgres

This means that in a development environnment (your local machine), Rails will attempt to connect to a database named "gdd-ai-staging" with the credentials as specified in username and password. You can use a generic password in the previous step, i.e. you can just use the username, "postgres", and the password, "postgres".

4. Run the postgres server
* on WSL2: sudo service postgresql start *
* on Mac: brew services start postgresql
  
# Windows Setup #

Please follow the directions @ https://learn.microsoft.com/en-us/windows/wsl/install to install WSL2, which is essentially a way to run a Linux environment on Windows 11. Please use the Ubuntu 20.4.6 LTS build. Now that you have WSL2 installed, you can open a Linux terminal (or command prompt) and then follow the rest of the directions.

A solid tutorial for the rest of the setup on WSL2 can be found at: 

https://codex.org/2022/08/19/setting-up-ruby-wsl2.html

The process is relatively straight forward, you will install a package manager, use the package manager to install a Ruby version manager, and finally use that Ruby version manager (rbenv, asdf, etc.) to install the right version of Ruby (in our case, ruby-3.2.2).

# Mac Setup #

On Mac, we will use Homebrew (https://brew.sh/) as a package manager. With Homebrew we will install Ruby and a Ruby version manager. 

1. Install Homebrew
* /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" *
2. Install a Ruby package manager (I prefer asdf as it supports multiple languages)
* See https://asdf-vm.com/guide/getting-started.html *
3. Add asdf to your ~/.bashrc file
* nano ~/.bashrc
* Append the following to the end of the file in the editor: . "$HOME/.asdf/asdf.sh"
* Press Control+x to exit, and save the file when prompted

# Windows/Mac Continuing Installation
1. Install the version of Ruby that we use for this project using asdf
* asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
* sudo apt-get update
* sudo apt-get install build-essential
* asdf install ruby 3.2.2
* asdf shell ruby 3.2.2
  
# Setting up the Repo
Requirement: I assume you already have Git in your environment, if not, you can install it following the instructions @ https://git-scm.com/downloads

1. Clone the repo into a directory of your choice
* git clone https://github.com/aryeshuacheng/gdd.git
2. In your cloned directory, run:
* rake db:create 
This will create the database in your local environment.
3. Run bundle, which installs all the gems and dependencies
* bundle install
4. Run migrations (migrations are essentially instructions to Ruby to transform databases to make changes such as creating new tables or creating new columns)
* rake db:migrate
5. If all goes well, you can start your Rails app with the following command which will start Rails on port 3000
* rails s -p 3000
6. You can visit the site by pointing your browser to
* localhost:3000

# Don't Panic #

Setting up your development environment will often run into snags no matter how well prepared we are. Feel free to contact me if you need help.
