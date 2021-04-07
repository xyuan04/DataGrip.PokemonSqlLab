# What are all the types of pokemon that a pokemon can have?
SELECT * FROM types;

# What is the name of the pokemon with id 45?
SELECT name FROM pokemons WHERE id = 45;

# How many pokemon are there?
SELECT COUNT(*) FROM pokemons;

# How many types are there?
SELECT COUNT(*) FROM types;

# How many pokemon have a secondary type?
SELECT COUNT(secondary_type) FROM pokemons;