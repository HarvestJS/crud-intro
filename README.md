# CRUD Intro

This is an introduction to setting up CRUD with Mongo and Express.  The focus for this project is on learning concepts and technologies.  This approach is not recommended for an actual project - there are better tools that will save you time on that.

You can find the (brief) introduction here: [http://slid.es/bitmage/crud-intro](http://slid.es/bitmage/crud-intro)

## Install Node

You have Node installed right?  If not, grab it here:

[http://nodejs.org/](http://nodejs.org/)

## Install Mongo

If you are familiar with your operating system's package manager, and can find mongo there, go ahead and use it.  Otherwise, download a binary here:

[http://www.mongodb.org/downloads](http://www.mongodb.org/downloads)

## Grab this Project

If you know how to clone the project, do that.  Otherwise, on the right side of the screen you should see "Download Zip".  Grab the file and extract it wherever you'd like to start working.

Open your favorite terminal and change to the project directory - we'll be running commands there.

## Install Dependencies

When you installed Node.js, you also got a command line tool called NPM (Node Package Manager).  Let's use that to install the modules we need.

First we'll do an install for all the project dependencies.  This will install all the 'dependencies' and 'devDependencies' from your package.json.  You can look at the file and compare to npm's output if you like.  Here's the command:

```bash
npm install
```

We've included a test suite in this project.  In order to run it, install the CLI tool:

```bash
npm install -g mocha
```

Now let's install 'mongoose', the tool we'll be using to construct our schema:

```bash
npm install mongoose --save
```

When you pass the --save option, npm will add this module to your package.json dependencies.  If you're curious, open package.json to verify that 'mongoose' was added.

## Run the Tests

If everything is installed properly, you should now be able to run the tests.  You should get a set of errors, one for each API endpoint we need to create.

```bash
mocha
```

You can also grep to filter out specific tests:

```bash
mocha --grep model
```

We won't be looking at how the tests were made in this class.  If you're interested in learning more about mocha, there will be an elective in the evening.  For now, you can use the output of the tests to guide your development.

## Creating A Mongoose Schema

Now on to development!

Let's create a 'User' model with the following keys:

 * email
 * first_name
 * last_name
 * role

Check out the Mongoose documentation for details on how to do this:

[http://mongoosejs.com/docs/guide.html](http://mongoosejs.com/docs/guide.html)

You can make these all strings.  Put your schema in the file user.js in the app folder.

When you've got your schema created, run 'mocha'.  The test 'model should save data' should now pass.

## User Listing (GET /users)

Next, we want to create an API endpoint that will list all our users.  For this step and the following ones, we'll be working out of the "app/server.js" file.

You can use the Mongoose find() method to get all the users:

http://mongoosejs.com/docs/api.html#model_Model.find

There is a "Hello World" route already present.  Create your own route which will listen at '/users', query the User model, and return something like this:

```javascript
{
  users: [
      email: ''
      first_name: ''
      last_name: ''
      role: ''
    ,
      ...next record
    ,
      ...next record
  ]
}
```

## Show a User (GET /users/:id)

For this, you'll need to figure out how to obtain the :id variable from the route.  Check out this documentation for help:

[http://expressjs.com/api.html#req.params](http://expressjs.com/api.html#req.params)

You can use the find method again on the User model, but is there something better suited for this task?  Check the Mongoose Model docs and see what's available.

Put the result in a 'user' key in your response.

## Creating New Users (POST /users)

Now we would like to allow the creation of new users.  In order to do this, we will need to accept data in the HTTP request.  Check out the docs for bodyParser():

http://expressjs.com/api.html#bodyParser

Check the Mongoose Model docs again for how to create new records.

There's a catch here too - up til now all our routes have returned a status of 200 - OK.  This route needs to return a 201 - the status code for CREATED.  Can you find out how to return a different status code from the Express docs?

## Update a User (PUT /users/:id)

This should be similar to the previous routes we've done.  In this case we're looking for a way to update a model.  Mongoose provides several ways of doing this.  Which one seems to fit your needs best?

## Delete a User (DELETE /users/:id)

Here we're not checking for any response body.  The test wants to see that the user gets deleted from the DB, and that a 200 OK is returned.

## Conclusion

That's it!  You've now gotten some basics about how a Node.js server might take requests and interact with a database.  There are many different patterns for organizing your server code as it starts to get complex.  The server is a place for:

* Business Logic - We should only sell widgets of types X and Y to a customer type of Z.
* Access Control - User identification, limiting their access.
* Inter-System Communication - Listening/sending events, requesting (possibly priveledged) data

## Further Info on REST

The REST (Representational State Transfer) principles have taken hold over the last decade as a standard for interoperability of 3rd party services.  This is opening up many possibilities, as it's easier than ever to work with existing systems that people have made.  If you'd like to learn more about REST, this is a great article:

http://www.infoq.com/articles/subbu-allamaraju-rest

This is a book by the same author:

http://shop.oreilly.com/product/9780596801694.do

And lastly, the same guy (former Yahoo developer) is now doing a project called ql.io:

http://ql.io/

As you can see, he's created a SQL like language for interacting with and tying together RESTful services.  Just goes to show how powerful standardization can be!

## License

(MIT License)
