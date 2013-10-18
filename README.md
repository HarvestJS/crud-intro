# CRUD Intro

This is an introduction to setting up CRUD with Mongo and Express.  The focus for this project is on learning concepts and technologies.  This approach is not recommended for an actual project - there are better tools that will save you time on that.

## Install Node

You have Node installed right?  If not, grab it here:

[http://nodejs.org/](http://nodejs.org/)

## Install Mongo

If you are familiar with your operating system's package manager, and can find mongo there, go ahead and use it.  Otherwise, download a binary here:

[http://www.mongodb.org/downloads](http://www.mongodb.org/downloads)

## Grab this Project

If you know how to clone the project, do that.  Otherwise, on the right side of the screen you should see "Download Zip".  Grab the file and extract it wherever you'd like to start working.

Open your favorite terminal and change to the project directory - we'll be running commands there.

## Install Some Modules

When you installed Node.js, you also got a command line tool called NPM (Node Package Manager).  Let's use that to install the modules we need.

First we'll do an install for all the project dependencies.  This will install all the 'dependencies' and 'devDependencies' from your package.json.  You can look at the file and compare to npm's output if you like.  Here's the command:

```bash
npm install
```

We've included a test suite for you to verify the code you write.  Mocha has a CLI, so let's install it globally so it becomes accessible:

```bash
npm install -g mocha
```

Now let's install 'mongoose', the tool we'll be using to construct our schema:

```bash
npm install mongoose --save
```

When you pass the --save option, npm will add this module to your package.json dependencies.  If you're curious, open the file to verify that it was changed.

## Run the Tests

If everything is installed properly, you should now be able to run the tests.  You should get a set of errors, one for each API endpoint we need to create.

```bash
mocha
```

## Creating A Mongoose Schema

For our purposes, we want a 'User' document with the following keys:

 * email
 * first_name
 * last_name
 * role

Check out the Mongoose documentation for details on how to do this:

[http://mongoosejs.com/docs/guide.html](http://mongoosejs.com/docs/guide.html)

You can make these all strings.  When you're ready, add your schema to the file user.js in the app folder.

When you've got your schema created, run 'mocha'.  The test 'model should save data' should now pass.

## User Listing (GET /users)

Next, we want to create an API endpoint that will list all our users.

## Show a User (GET /users/:id)

## Creating New Users (POST /users)

Now we would like to allow the creation of new users.  In order to do this, we will need to accept data in the HTTP request.  Check out the docs for bodyParser():

http://expressjs.com/api.html#bodyParser

## Update a User (PUT /users/:id)

## Delete a User (DELETE /users/:id)

## License

(MIT License)
