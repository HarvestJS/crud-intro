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

## License

(MIT License)
