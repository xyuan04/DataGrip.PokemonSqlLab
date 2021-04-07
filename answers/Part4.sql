#Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type
#Pokemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name

#Sort by trainer by strongest to weakest

//Ranking is based on average stats of all owned Pokemon

SELECT p.name as "Pokemon Name", t.trainername as "Trainer Name", pt.pokelevel as "Pokemon Level", tp.name as "Primary Type", tp2.name as "Secondary Type", Score
FROM trainers t
         JOIN pokemon_trainer pt
              ON pt.trainerID = t.trainerID
         JOIN pokemons p
              ON pt.pokemon_id = p.id
         JOIN types tp
              ON p.primary_type = tp.id
         JOIN types tp2
              ON p.secondary_type = tp2.id
         JOIN (SELECT AVG(maxhp + attack + defense + spatk + spdef + speed) as "Score", trainerID
               FROM pokemon_trainer GROUP BY trainerID) as power ON power.trainerID = pt.trainerID
ORDER BY Score DESC;