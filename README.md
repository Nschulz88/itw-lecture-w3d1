# Example app to teach Embedded Ruby (ERB)

This is the code used in my week 3 lecture of teaching 'Intro to Web Development' at Lighthouse Labs.

If you'd like to try and run this on your computer at home, follow the following steps:

1. Fork this repo (so you have a copy on your github account). The button to fork it is at the far top right corner of this page.
2. Once you have the copy on your account (make sure you are no longer on my Githib page *Nschulz88*, but on your own). Click the green button `Clone or Download` - copy that line `git@git...` by clicking the file icon.
3. Enter your terminal on your computer and navigate to the directory you want to copy this project into. You can use `cd` to change your dirrectory (`cd ..` goes up a directory, `ls` shows what the directory you are in contains).
4. Paste that line you copied into your terminal. That line will look something like this: `git@github.com:<YOUR_USER_NAME>/itw-lecture-w3d1.git` and hit enter.
5. You will now have a copy of this project on your computer.
6. Type `cd itw-lecture-w3d1` to navigate INTO this project.
7. Type `gem install bundler` & hit enter
8. Type `bundle install` & hit enter
9. Type `bundle exec shotgun -p 3000 -o 0.0.0.0` & hit Enter
10. Open `http://localhost:3000/` in your browser & you should see this website running.

_NOTE:_ To run this app you must have ruby installed on your computer. I believe all Mac Laptops come with Ruby pre-installed, but if you are working on a Windows computer, you may have to manually install it. This can be tricky - this is the official website for Ruby and does state how to install it (here)[https://www.ruby-lang.org/en/documentation/installation/], BUT I would strongly suggest NOT to dig your way through it at this point as it can be VERY frustrating.

You can check if your machine has ruby installed already by typing `ruby -v` into your terminal command line. If this throws an error, it means you do not have ruby and you cannot run this project yet.


## Note to students
Guten Abend (good evening in German... since German treats were our topic today :)

Today's curriculum was packed with new syntax & concepts - hope my example web site with the _German Christmas Treats_ helped you work through some of the Finstagram assignments you were given.

Since we ran out of time to cover some overarching information of web development I'll try to cover a tiny bit in these notes. Also, here's a short video I found helpful to review the structure of the *Backend* of a web site / web app: (YouTube Video)[https://www.youtube.com/watch?v=4r6WdaY3SOA]

Remember, *Ruby* is a back-end language.
HTML & CSS are front-end languages.
Why are we learning Ruby? Because it is a very popular language, and we simply had to choose one to start with. Many large companies use Ruby as their back-end code, like *AirBnB*, *Bloomberg*, *SoundCloud* or *Groupon*.
Other backend languages are JavaScript, PHP, Python and many more.
But in the end, they can all do the same thing.

Now, the more abstract piece we are working with is *Sinatra*. Don't worry _too_ much about fully understanding it right away as there is a lot of "magic" built into Sinatra. But it may help to think about it in this way: For the front-end part of our codebase we have the Browser (Chrome, Safari) that reads our HTML & CSS and _understands_ it. In the back-end we need a Server to read and understand our Ruby code. Sinatra is a helper framework (software) to very quickly spin up this server for us. And just like we don't know exactly how the browser functions 'on the inside' we don't need to fully understand how our server functions. For now, we just need to know that we need a server to read and understand our back-end code -> That's Sinatra.

Recap of today:

### Ruby methods
Methods are a way to store some operation to reuse multiple times instead of having the write the same code over and over again.

In the below method we have 2 dynamic values that make this block of code reuseable for any person we'd like to check their age - `age` and `name` are given to the method as **arguments**.

```ruby
def can_person_drink(age, name)
  if age < 19
    puts "#{name} is too young to drink"
  else
    puts "Cheers to you, #{name}"
  end
end
```

### Iterators

Iterators are a way to tell the computer to repeat an operation x amount of times. You can do this by using one of the many available *loops* in Ruby. In the first example below you can also use the array `[1,2,3,4,5,6,7,8,9,10]` instead of `(1..10)` it is the same thing just a shorter way of writing it.

```ruby
(1..10).each do |variable|
  p "This is number #{variable}"
end
```

```ruby
3.times do |variable_name|
# code to be execute
end
```
Here are two webites to look up all the different loop options in Ruby:
- (launchschool Ruby)[https://launchschool.com/books/ruby/read/loops_iterators#simpleloop]
- (geeksforgeeks Ruby)[https://www.geeksforgeeks.org/ruby-types-of-iterators/]

### ERB (Embedded Ruby)

Instead of writing all the HTML we need ourself line by line, we can now dynamically create it by using loops _inside_ of our HTML files. But watch out, you must change the file ending from `.html` to `.erb` so Sinatra knows what type of file it is receiving. Once our filenem ends in `.erb` we can write Ruby code by embedding it into our HTML within "Aligator Tags".

In our defined routes (our `actions.rb` file) we tell Sinatra to load up the `index.erb` file once the Homepage (`'/'`) is requested.

Sinatra will always FIRST search for a `layout.erb` file to use as the base (what I kept calling it the skeleton file structure today...) and will then inject whichever file you defined into the `<%= yield %>` placeholder in the `layout.erb` file. In the below example we want to inject the `index.erb` into the `layout.erb` file:

_this is my actions.rb file:_
```ruby
  get '/' do
    erb(:index)
  end
```

_this is my layout.erb file:_
```html
<!DOCTYPE html>
<html>

  <head>
    <link rel="stylesheet" href="normalize.css">
    <link rel="stylesheet" href="app.css">
    <title>Xmas Treats</title>
  </head>

  <body>
    <h1 class="christmas-title">
      German Christmas Treats
    </h1>
    <%= yield %>
  </body>
</html>
```

_this is my index.erb file:_
```html
  <ul>
    <% @treats.each do |treat| %>
      <li>
        <h3>
          <%= treat[:name] %>
        </h3>
        <img src="<%= treat[:img_url] %>" />
      </li>
    <% end %>
  </ul>
```
