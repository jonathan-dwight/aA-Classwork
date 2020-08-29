def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  #Movie.select(:title, :id).joins(:actors).where.not("actors.name NOT IN (?)", those_actors).group("castings.movie_id").having("castings.ord = 1")

  Movie.select(:title, :id).joins(:actors).group("movies.id").where("actors.name IN (?)", those_actors).having("COUNT(actors.id) = ?", those_actors.length)
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie.group("decade").limit(1).order("AVG(movies.score) DESC").pluck("((movies.yr / 10)*10) AS decade")[0]
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  titles = Movie.joins(:actors).where("actors.name = ?", name).pluck("movies.title")
  Actor.joins(:movies).where("movies.title IN (?)", titles).where("actors.name != (?)", name).distinct.pluck(:name)
  # Actor.select(:name).joins(:castings).group("actors.name").where("actors.name = ?", name).having("actors.name != ?", name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor.left_outer_joins(:castings).where("castings.actor_id IS NULL").pluck("COUNT(actors.id)")[0]
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  # group by movies - grab max and min of years for each actor
  Actor.select("actors.*, (MAX(movies.yr)-MIN(movies.yr)) AS career").joins(:movies).group('actors.id, actors.name').order("career DESC").limit(3)
end
