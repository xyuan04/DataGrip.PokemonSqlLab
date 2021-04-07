# What is each pokemon's primary type?
SELECT p.name, t.name FROM pokemons p JOIN types t ON p.primary_type = t.id;

# What is Rufflet's secondary type?
SELECT p.name, t.name FROM pokemons p JOIN types t ON p.secondary_type = t.id WHERE p.name = 'Rufflet';

# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT pt.trainerID, t.trainername, p.name
FROM pokemon_trainer pt
         JOIN trainers t
              ON pt.trainerID = t.trainerID
         JOIN pokemons p
              ON pt.pokemon_id = p.id
WHERE pt.trainerID = 303;

# How many pokemon have a secondary type Poison
SELECT COUNT(*)
FROM pokemons p
         JOIN types t
              ON p.secondary_type = t.id
WHERE t.name = 'Poison';

# What are all the primary types and how many pokemon have that type?
SELECT t.name, COUNT(*)
FROM types t
         JOIN pokemons p
              ON t.id = p.primary_type
GROUP BY t.name;

# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT COUNT(pokelevel) numberOfLevel100s
FROM pokemon_trainer
WHERE pokelevel = 100
GROUP BY trainerID;

# How many pokemon only belong to one trainer and no other?
SELECT COUNT(pt.pokemon_id), p.name
FROM pokemon_trainer pt
JOIN pokemons p
ON pt.pokemon_id = p.id
GROUP BY pt.pokemon_id
HAVING COUNT(pt.pokemon_id) = 1;