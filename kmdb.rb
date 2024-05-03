# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

#SS: destroy commands for each class below (although classes are defined in the next step)

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# SS: completed and tested 

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#SS: All data entry is below

#studios

addstudio = Studio.new
addstudio["name"] = "Warner Bros."
addstudio.save
warnerbros = Studio.find_by({"name" => "Warner Bros."})


#movies

addmovie = Movie.new
addmovie["title"] = "Batman Begins"
addmovie["year_released"] = 2005
addmovie["rated"] = "PG-13"
addmovie["studio_id"] = warnerbros.id
addmovie.save

addmovie = Movie.new
addmovie["title"] = "The Dark Knight"
addmovie["year_released"] = 2008
addmovie["rated"] = "PG-13"
addmovie["studio_id"] = warnerbros.id
addmovie.save

addmovie = Movie.new
addmovie["title"] = "The Dark Knght Rises"
addmovie["year_released"] = 2013
addmovie["rated"] = "PG-13"
addmovie["studio_id"] = warnerbros.id
addmovie.save

#actors

addactor = Actor.new
addactor["name"] = "Christian Bale"
addactor.save
addactor = Actor.new
addactor["name"] = "Michael Cane"
addactor.save
addactor = Actor.new
addactor["name"] = "Liam Neeson"
addactor.save
addactor = Actor.new
addactor["name"] = "Katie Holmes"
addactor.save
addactor = Actor.new
addactor["name"] = "Gary Oldman"
addactor.save
addactor = Actor.new
addactor["name"] = "Heath Ledger"
addactor.save
addactor = Actor.new
addactor["name"] = "Aaron Eckhart"
addactor.save
addactor = Actor.new
addactor["name"] = "Maggie Gyllenhaal"
addactor.save
addactor = Actor.new
addactor["name"] = "Tom Hardy"
addactor.save
addactor = Actor.new
addactor["name"] = "Joseph Gordon-Levitt"
addactor.save
addactor = Actor.new
addactor["name"] = "Anne Hathaway"
addactor.save

# role / character mapping (overall)

christianb = Actor.find_by(name: "Christian Bale")
michaelc = Actor.find_by(name: "Michael Cane")
liamn = Actor.find_by(name: "Liam Neeson")
katieh = Actor.find_by(name: "Katie Holmes")
garyo = Actor.find_by(name: "Gary Oldman")
heathl = Actor.find_by(name: "Heath Ledger")
aarone = Actor.find_by(name: "Aaron Eckhart")
maggieg = Actor.find_by(name: "Maggie Gyllenhaal")
tomh = Actor.find_by(name: "Tom Hardy")
josephgl = Actor.find_by(name: "Joseph Gordon-Levitt")
anneh = Actor.find_by(name: "Anne Hathaway")

# movie and role mapping

batman1 = Movie.find_by(title: "Batman Begins")
batman2 = Movie.find_by(title: "The Dark Knight")
batman3 = Movie.find_by(title: "The Dark Knght Rises")
Role.create(movie_id: batman1.id, actor_id: christianb.id, character_name: "Bruce Wayne")
Role.create(movie_id: batman1.id, actor_id: michaelc.id, character_name: "Alfred")
Role.create(movie_id: batman1.id, actor_id: liamn.id, character_name: "Ra's Al Ghul")
Role.create(movie_id: batman1.id, actor_id: katieh.id, character_name: "Rachel Dawes")
Role.create(movie_id: batman1.id, actor_id: garyo.id, character_name: "Commissioner Gordon")
Role.create(movie_id: batman2.id, actor_id: christianb.id, character_name: "Bruce Wayne")
Role.create(movie_id: batman2.id, actor_id: heathl.id, character_name: "Joker")
Role.create(movie_id: batman2.id, actor_id: aarone.id, character_name: "Harvey Dent")
Role.create(movie_id: batman2.id, actor_id: michaelc.id, character_name: "Alfred")
Role.create(movie_id: batman2.id, actor_id: maggieg.id, character_name: "Rachel Dawes")
Role.create(movie_id: batman3.id, actor_id: christianb.id, character_name: "Bruce Wayne")
Role.create(movie_id: batman3.id, actor_id: garyo.id, character_name: "Commissioner Gordon")
Role.create(movie_id: batman3.id, actor_id: tomh.id, character_name: "Bane")
Role.create(movie_id: batman3.id, actor_id: josephgl.id, character_name: "John Blake")
Role.create(movie_id: batman3.id, actor_id: anneh.id, character_name: "Selina Kyle")


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

movies = Movie.all
for x in movies
    studio=Studio.find_by(id: x.studio_id)
    puts "#{x.title}    #{x.year_released}    #{x.rated}    #{studio["name"]}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

roles=Role.all
for y in roles
    actors=Actor.find_by(id: y.actor_id)
    movies=Movie.find_by(id: y.movie_id)
    puts "#{movies.title}    #{actors.name}    #{y.character_name}" 
end
