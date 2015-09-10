## Objectives

1. Understand the significance of capturing and operating on user input in a CLI application. 
2. Learn how to create a prompt for user input in a CLI. 
3. Learn to use the `gets` method to capture, store and operate on that inupt. 

## User Input and the CLI

> I think it's fair to say that personal computers have become the most empowering tool we've ever created. They're tools of communication, they're tools of creativity, and they can be shaped by their user
> –– Bill Gates


It is inarguable that the advent of personal computing has changed the world and the way that individuals interact with it and with one another. The core of this revolution has been interactivity. The capability of computers to *be interacted with*. Who builds this interactive capability? We do! As a programmer, the underlying functionality of many of the applications you build will be interaction, the interaction between and user and your program. There are many ways in which that interaction can play out. Here, we'll discuss one of the most basic ways––the `gets` method and the command line interface (CLI).  

## CLI Flow
  
 The basic flow of a CLI app goes something like this: 
 
 1. Greet the user.
 2. Ask the user for input. 
 3. Capture and store that input. 
 4. Do something with that input. 

We'll be building out this flow together in this lab. Checkout out the video below for the example implementation.

Note that the program greets the user, asks for their name and then uses that name to greet them personally. Before we jump into writing the code, let's check out the file structure of this project. 

## Project Structure

**If you haven't done so already, fork and clone this lab down onto your computer**. 

Check out the file structure below. 

```
bin
   |–– greeting
lib 
   |–– hello_ruby_programmer.rb
spec
   |–– 01_hello_ruby_programmer_spec.rb
   |–– 02_cli_spec.rb
   |–– spec_helper.rb
...
```  

Let's take a moment to review: 

### The `bin` Directory

The `bin` directory holds our **exectuable** file. This file is responsible for running the program. It contains code that actually enacts the command line interaction––i.e. greeting the user, asking the user for input, storing that input and then acting on it. 

### The `lib` Directory

The `lib` directory is where we place the code that our program relies on to run. It is the meat of our CLI application. Our executable file *requires* the files in the `lib` directory and uses the code (for example, calling on any methods we might define) to to enact the CLI. 

### The `spec` Directory

This directory contains the tests for our program. We have tests for the code in the `lib` directory in `spec/01_hello_ruby_programmer.rb` and tests for the CLI, i.e. the user interaction portion of our application, in `spec/02_cli_spec.rb`. We'll use the test output from running `learn` along with the guidelines below to get our program working. 

One last thing before we start coding––the `gets` method. 

## The `gets` Method

We've talked a lot about capturing and storing a user's input to the terminal and using it in our Ruby program. Now we'll take a closer look at exactly how that happens. 

Let's take a look at an example. Copy and paste the below code into `irb` in your terminal. Then, execute the method by calling it with `your_name_is`.  

```ruby
def your_name_is
	puts "Please enter your name:"
	response = gets.strip
	puts "Your name is: #{response}"
end
```
On the second line of the method, the `gets` method is being called. Calling the `gets` method captures the last thing the user typed into the terminal. The return value of `gets` is the text typed into the terminal. So, setting a variable, `respone`, equal to invoking the `gets` method sets that variable equal to the return value of `gets`––the last thing types into tht terminal. Then, the following line uses that `response` variable in string interpolation. Once we store the return value of `gets` in a variable, we can treat that variable as we would any variable pointing to a string––interpolate with it, convert it to an integer, add it to an array, you name it.

### Advanced: How `gets` gets input from the terminal
We already know, in general terms, how the `puts` method outputs text to the terminal, but here's a reminder from an earlier lesson, "Puts, Print and Return":

>How do the puts and print methods actually output text to your console? They use the $stdout global variable provided to us by Ruby. You don't need to worry about global variables right now. For the purposes of understanding how puts and print work, we just need to understand the following:

>Your computer has an stdout file that communicates with your operating system. So, puts and print actually send output to the $stdout variable. The $stdout variable sends that information to the stdout file on your computer which in turn communicates with your operating system which in turn outputs that information to the console.


The `gets` method works similarly. Just like your computer has a standard output file, it has a standard input file. When you enter text in your terminal, you are writing to that file. And, just like Ruby has a $stdout global variable, it has a $stdin global variable. The $stdin variable holds a stream from the standard input. It can be used to read input from the console. 

The `gets` method wraps the $stdin variable, reading text from the standard input and allowing you to store that text in a variable, so that you can operate on it later. 

### A Note on `strip`

One thing to know about the `gets` method is that it captures a new line character at the end of whatever input it is storing. We don't want extra whitespace or new lines to be appended to the user input we are trying to store. So, we can chain a call to the `.strip` method to remove any new lines or trailing whitespace. 


## Instructions

### Part I: The 	`greeter` Method

Before we worry about building the CLI, we need to build the core functionality of our program––that is, the actions that will be carried out once we obtain the user's input. That code belongs in the `lib` directory. 

Open up `lib/hello_ruby_programmer.rb`. This is where we'll be writing our code. This part of the lab is test-driven. So, run the test for *just this section* by typing `spec/01_hello_ruby_programmer.rb` in your terminal. 

In order to get our tests passing, we'll need to define a method, `#greeter` that takes in an argument of a person's name and uses string interpolation to return `"Hi, #{name}! Welcome to the wonderful world of Ruby programming."`. 

Once you get these tests passing, you're ready to move on to the next section. 

### Part II: The CLI

Our CLI code belongs in the `bin` directory. Open up `bin/greeter`. Notice that, according to convention, our executable file does not have a file extension (such as `.rb`). Take a look at the first lines of the file: 

```ruby
#!/usr/bin/env ruby
require_relative '../lib/hello_ruby_programmer.rb'
```
First, we have our shebang line that tells the terminal which interpreter to use to execute the remainder of the file. Second, we are requiring the `hello_ruby_programmer.rb` file, from within the `lib` directory. This gives our executable file access to whatever code we write in that file. 

If we run `learn` we can see from the test output that the following is required: 

1. Use `puts` to output the string "Hi! Welcome to the wonderful world of Ruby programming."
2. Use `puts` to prompt the user for input with the phrase: "Please enter your name so that we can greet you more personally:"
3. Use the `gets.strip` method to store the user's input and set it equal to a variable. 
4. Use `puts` to output the return value of calling the `#greeting` method, with the argument of the user's input. 






  
