**Basic formula for one player**  
Sum all game points player played scaled by the division factor  
n - number of game results in which player participated  
matchDivision - division the match/game was played in  
q- number of games in a match  
gamePoints - points in a game for the player  
  
$$rankPoints = \sum_{i=1}^{n} ((11 - matchDivision_i) * \sum_{j=1}^{q} gamePointsFor_j)$$  
