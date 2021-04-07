Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type
Pokemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name

Sort by trainer by strongest to weakest

//The person with the most pokemon in the top 10 is the strongest

SELECT p.name as "Pokemon Name", t.trainername as "Trainer Name", pt.pokelevel as "Pokemon Level", tp.name as "Primary Type", tp2.name as "Secondary Type", (AVG(pt.maxhp) + AVG(pt.attack) + AVG(defense) + AVG(spatk) + AVG(spdef) + AVG(speed))/6 as "Score"
FROM trainers t
         JOIN pokemon_trainer pt
              ON pt.trainerID = t.trainerID
         JOIN pokemons p
              ON pt.pokemon_id = p.id
         JOIN types tp
              ON p.primary_type = tp.id
         JOIN types tp2
              ON p.secondary_type = tp2.id
GROUP BY t.trainername, p.name, pt.pokelevel, tp.name, tp2.name
ORDER BY Score DESC;